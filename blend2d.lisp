;; blend2d.lisp
;; Copyright (c) 2023 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>

;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :blend2d)

(loop for sym being the external-symbols of :blend2d.ll
      for ssym = (symbol-name sym) then (symbol-name sym)
      when (not (or (cl-ppcre:scan "-IMPL" ssym)
                    (cl-ppcre:scan ".IMPL\*" ssym)
                    (cl-ppcre:scan "^\\+__" ssym)
                    (cl-ppcre:scan "^__" ssym)
                    (cl-ppcre:scan "&" ssym)
                    (cl-ppcre:scan "(_|-)H+" ssym)
                    (cl-ppcre:scan "PTHREAD" ssym)))
      collect (export sym))

(defparameter *log-level* 1)

(declaim (inline nullp home-dir image-codec-by-name bl-alloc bl-free))
(defun nullp ()
  (cffi:null-pointer))

(defun bl-alloc (object-type &optional (count 1))
  (autowrap:alloc object-type count))

(defun bl-free (object-pointer)
  (autowrap:free object-pointer))

(defun image-codec-by-name (codec name)
  (blll::image-codec-find-by-name
   codec
   name
   ;; Assume (sizeof ulong) as size of size_t and corresponding max value for SIZE_MAX
   (1- (ash 1 (* 8 (cffi:foreign-type-size :ulong))))
   (cffi:null-pointer)))

;; Copied from https://git.sr.ht/~jl2/j-utils
(defun home-dir (path)
  "Utility function to make relative path names relative to the user's home directory to work around Cairo weirdness."
  (format nil "~a" (merge-pathnames path (user-homedir-pathname))))

(defmacro with-objects ((&rest object-definitions) &body body)
  (alexandria:with-gensyms (result)
    (let ((alloc-defs (mapcar
                       (lambda (def)
                         (list (car def)
                               (list 'autowrap:alloc
                                     (list 'quote (cadr def)))))
                       object-definitions))
          (free-calls (reverse
                       (mapcar
                        (lambda (def)
                          (list
                           'progn
                           (let* ((type-name (string (cadr def)))
                                  (len-m-5 (- (length type-name) 5)))
                             (when (and (> (length type-name) 6)
                                        (string= (subseq type-name len-m-5) "-CORE"))
                               (list 'lookup-error
                                     (list
                                      (intern (format nil "~a-DESTROY" (subseq type-name 0 len-m-5)) 'blll)
                                      (car def)))))
                           (list 'autowrap:free (car def))))
                        object-definitions))))
      `(let (,@alloc-defs
             (,result nil))
         (handler-case
             (setf ,result (progn
                             ,@body))
           (t (err)
             (format t "Caught ~a~%~%" err)
             ;; (format t "Caught ~a~%~a~%" err (trivial-backtrace:backtrace-string))
             ))
         ,@free-calls
         ,result))))

(defmacro with-image-context* ((image context file-name
                                      &key
                                      (width 1200)
                                      (height 1200)
                                      (codec-name "BMP"))
                                        (&rest object-definitions)
                               &body body)
  (alexandria:with-gensyms (result filename codec)
    `(let ((,result nil)
           (,filename ,file-name))
       (with-objects ((,image image-core)
                      (,context context-core)
                      (,codec image-codec-core)
                      ,@object-definitions)
         (handler-case
             (progn
               (lookup-error (image-init-as ,image ,width ,height +format-prgb32+))
               (lookup-error (context-init-as ,context ,image (cffi:null-pointer)))
               (lookup-error (context-set-comp-op ,context +comp-op-src-copy+))
               (lookup-error (context-fill-all ,context))

               (setf ,result (progn ,@body))

               (lookup-error (context-end ,context))
               (lookup-error (image-codec-init ,codec))
               (lookup-error (image-codec-by-name ,codec ,codec-name))
               (ensure-directories-exist ,filename)
               (when (uiop/filesystem:file-exists-p (home-dir ,filename))
                 (delete-file (home-dir ,filename)))
               (lookup-error (image-write-to-file ,image (format nil "~a" (home-dir ,filename)) ,codec))
               ,result)
           (t (err)
             (setf ,result err)
             ;;(format t "Caught ~a~%~a~%" err (trivial-backtrace:backtrace-string))
             (format t "Caught ~a~%~%" err)))
         ,result))))

(defmacro with-memory-image-context* ((image context
                                             &key
                                             (width 1200)
                                             (height 1200))
                                               (&rest object-definitions)
                                      &body body)
  (alexandria:with-gensyms (result)
    `(let ((,result nil))
       (with-objects ((,image image-core)
                      (,context context-core)
                      ,@object-definitions)
         (handler-case
             (progn
               (lookup-error (image-init-as ,image ,width ,height +format-prgb32+))
               (lookup-error (context-init-as ,context ,image (cffi:null-pointer)))
               (lookup-error (context-set-comp-op ,context +comp-op-src-copy+))
               (lookup-error (context-fill-all ,context))

               (setf ,result (progn ,@body))

               (lookup-error (context-end ,context))
               ,result)
           (t (err)
             (setf ,result err)
             ;; (format t "Caught ~a~%~a~%" err (trivial-backtrace:backtrace-string))
             (format t "Caught ~a~%~%" err)))
         ,result))))

(defmacro with-image-context ((image context file-name
                                     &key
                                     (width 1200)
                                     (height 1200)
                                     (codec-name "BMP"))
                              &body body)
  (alexandria:with-gensyms (result codec)
    `(let ((,result nil))
       (with-objects ((,image  image-core)
                      (,context  context-core)
                      (,codec  image-codec-core))
         (handler-case
             (progn
               (image-init-as ,image ,width ,height +format-prgb32+)
               (context-init-as ,context ,image (cffi:null-pointer))
               (context-set-comp-op ,context +comp-op-src-copy+)
               (context-fill-all ,context)

               (setf ,result (progn,@body))

               (context-end ,context)
               (image-codec-init ,codec)
               (image-codec-by-name ,codec ,codec-name)
               (ensure-directories-exist ,file-name)
               (when (uiop/filesystem:file-exists-p (home-dir ,file-name))
                 (delete-file (home-dir ,file-name)))
               (image-write-to-file ,image (home-dir ,file-name) ,codec)
               ,result)
           (t (err)
             (setf ,result err)
             ;;(format t "Caught ~a~%~a~%" err (trivial-backtrace:backtrace-string))
             (format t "Caught ~a~%~%" err)))
         ,result))))

(defparameter *error-lookup*
  (list
   (cons blend2d.ll::+ERROR-ACCESS-DENIED+ '+ERROR-ACCESS-DENIED+)
   (cons blend2d.ll::+ERROR-BUSY+ '+ERROR-BUSY+)
   (cons blend2d.ll::+ERROR-ALREADY-EXISTS+ '+ERROR-ALREADY-EXISTS+)
   (cons blend2d.ll::+ERROR-BROKEN-PIPE+ '+ERROR-BROKEN-PIPE+)
   (cons blend2d.ll::+ERROR-FILE-EMPTY+ '+ERROR-FILE-EMPTY+)
   (cons blend2d.ll::+ERROR-DATA-TOO-LARGE+ '+ERROR-DATA-TOO-LARGE+)
   (cons blend2d.ll::+ERROR-DATA-TRUNCATED+ '+ERROR-DATA-TRUNCATED+)
   (cons blend2d.ll::+ERROR-DECOMPRESSION-FAILED+ '+ERROR-DECOMPRESSION-FAILED+)
   (cons blend2d.ll::+ERROR-FONT-FEATURE-NOT-AVAILABLE+ '+ERROR-FONT-FEATURE-NOT-AVAILABLE+)
   (cons blend2d.ll::+ERROR-FILE-NAME-TOO-LONG+ '+ERROR-FILE-NAME-TOO-LONG+)
   (cons blend2d.ll::+ERROR-FILE-TOO-LARGE+ '+ERROR-FILE-TOO-LARGE+)
   (cons blend2d.ll::+ERROR-FONT-CFF-INVALID-DATA+ '+ERROR-FONT-CFF-INVALID-DATA+)
   (cons blend2d.ll::+ERROR-IMAGE-DECODER-NOT-PROVIDED+ '+ERROR-IMAGE-DECODER-NOT-PROVIDED+)
   (cons blend2d.ll::+ERROR-FONT-MISSING-IMPORTANT-TABLE+ '+ERROR-FONT-MISSING-IMPORTANT-TABLE+)
   (cons blend2d.ll::+ERROR-FONT-NO-CHARACTER-MAPPING+ '+ERROR-FONT-NO-CHARACTER-MAPPING+)
   (cons blend2d.ll::+ERROR-FONT-PROGRAM-TERMINATED+ '+ERROR-FONT-PROGRAM-TERMINATED+)
   (cons blend2d.ll::+ERROR-IMAGE-UNKNOWN-FILE-FORMAT+ '+ERROR-IMAGE-UNKNOWN-FILE-FORMAT+)
   (cons blend2d.ll::+ERROR-IMAGE-ENCODER-NOT-PROVIDED+ '+ERROR-IMAGE-ENCODER-NOT-PROVIDED+)
   (cons blend2d.ll::+ERROR-IMAGE-NO-MATCHING-CODEC+ '+ERROR-IMAGE-NO-MATCHING-CODEC+)
   (cons blend2d.ll::+ERROR-IMAGE-TOO-LARGE+ '+ERROR-IMAGE-TOO-LARGE+)
   (cons blend2d.ll::+ERROR-INVALID-FILE-NAME+ '+ERROR-INVALID-FILE-NAME+)
   (cons blend2d.ll::+ERROR-INTERRUPTED+ '+ERROR-INTERRUPTED+)
   (cons blend2d.ll::+ERROR-INVALID-ALIGNMENT+ '+ERROR-INVALID-ALIGNMENT+)
   (cons blend2d.ll::+ERROR-INVALID-DATA+ '+ERROR-INVALID-DATA+)
   (cons blend2d.ll::+ERROR-INVALID-SEEK+ '+ERROR-INVALID-SEEK+)
   (cons blend2d.ll::+ERROR-INVALID-GEOMETRY+ '+ERROR-INVALID-GEOMETRY+)
   (cons blend2d.ll::+ERROR-INVALID-GLYPH+ '+ERROR-INVALID-GLYPH+)
   (cons blend2d.ll::+ERROR-INVALID-HANDLE+ '+ERROR-INVALID-HANDLE+)
   (cons blend2d.ll::+ERROR-INVALID-VALUE+ '+ERROR-INVALID-VALUE+)
   (cons blend2d.ll::+ERROR-INVALID-SIGNATURE+ '+ERROR-INVALID-SIGNATURE+)
   (cons blend2d.ll::+ERROR-INVALID-STATE+ '+ERROR-INVALID-STATE+)
   (cons blend2d.ll::+ERROR-INVALID-STRING+ '+ERROR-INVALID-STRING+)
   (cons blend2d.ll::+ERROR-JPEG-MULTIPLE-SOF+ '+ERROR-JPEG-MULTIPLE-SOF+)
   (cons blend2d.ll::+ERROR-IO+ '+ERROR-IO+)
   (cons blend2d.ll::+ERROR-JPEG-INVALID-SOF+ '+ERROR-JPEG-INVALID-SOF+)
   (cons blend2d.ll::+ERROR-JPEG-INVALID-SOS+ '+ERROR-JPEG-INVALID-SOS+)
   (cons blend2d.ll::+ERROR-NO-DEVICE+ '+ERROR-NO-DEVICE+)
   (cons blend2d.ll::+ERROR-JPEG-UNSUPPORTED-FEATURE+ '+ERROR-JPEG-UNSUPPORTED-FEATURE+)
   (cons blend2d.ll::+ERROR-JPEG-UNSUPPORTED-SOF+ '+ERROR-JPEG-UNSUPPORTED-SOF+)
   (cons blend2d.ll::+ERROR-MEDIA-CHANGED+ '+ERROR-MEDIA-CHANGED+)
   (cons blend2d.ll::+ERROR-NO-MEDIA+ '+ERROR-NO-MEDIA+)
   (cons blend2d.ll::+ERROR-NO-ENTRY+ '+ERROR-NO-ENTRY+)
   (cons blend2d.ll::+ERROR-NO-MATCHING-COOKIE+ '+ERROR-NO-MATCHING-COOKIE+)
   (cons blend2d.ll::+ERROR-NO-MATCHING-VERTEX+ '+ERROR-NO-MATCHING-VERTEX+)
   (cons blend2d.ll::+ERROR-NO-STATES-TO-RESTORE+ '+ERROR-NO-STATES-TO-RESTORE+)
   (cons blend2d.ll::+ERROR-NO-MORE-DATA+ '+ERROR-NO-MORE-DATA+)
   (cons blend2d.ll::+ERROR-NO-MORE-FILES+ '+ERROR-NO-MORE-FILES+)
   (cons blend2d.ll::+ERROR-NO-SPACE-LEFT+ '+ERROR-NO-SPACE-LEFT+)
   (cons blend2d.ll::+ERROR-NOT-FILE+ '+ERROR-NOT-FILE+)
   (cons blend2d.ll::+ERROR-NOT-BLOCK-DEVICE+ '+ERROR-NOT-BLOCK-DEVICE+)
   (cons blend2d.ll::+ERROR-NOT-DIRECTORY+ '+ERROR-NOT-DIRECTORY+)
   (cons blend2d.ll::+ERROR-NOT-EMPTY+ '+ERROR-NOT-EMPTY+)
   (cons blend2d.ll::+ERROR-NOT-ROOT-DEVICE+ '+ERROR-NOT-ROOT-DEVICE+)
   (cons blend2d.ll::+ERROR-NOT-IMPLEMENTED+ '+ERROR-NOT-IMPLEMENTED+)
   (cons blend2d.ll::+ERROR-NOT-INITIALIZED+ '+ERROR-NOT-INITIALIZED+)
   (cons blend2d.ll::+ERROR-NOT-PERMITTED+ '+ERROR-NOT-PERMITTED+)
   (cons blend2d.ll::+ERROR-PNG-INVALID-FILTER+ '+ERROR-PNG-INVALID-FILTER+)
   (cons blend2d.ll::+ERROR-NOT-SAME-DEVICE+ '+ERROR-NOT-SAME-DEVICE+)
   (cons blend2d.ll::+ERROR-OPEN-FAILED+ '+ERROR-OPEN-FAILED+)
   (cons blend2d.ll::+ERROR-OUT-OF-MEMORY+ '+ERROR-OUT-OF-MEMORY+)
   (cons blend2d.ll::+ERROR-PNG-INVALID-TRNS+ '+ERROR-PNG-INVALID-TRNS+)
   (cons blend2d.ll::+ERROR-PNG-INVALID-IDAT+ '+ERROR-PNG-INVALID-IDAT+)
   (cons blend2d.ll::+ERROR-PNG-INVALID-IEND+ '+ERROR-PNG-INVALID-IEND+)
   (cons blend2d.ll::+ERROR-PNG-INVALID-PLTE+ '+ERROR-PNG-INVALID-PLTE+)
   (cons blend2d.ll::+ERROR-SYMLINK-LOOP+ '+ERROR-SYMLINK-LOOP+)
   (cons blend2d.ll::+ERROR-PNG-MULTIPLE-IHDR+ '+ERROR-PNG-MULTIPLE-IHDR+)
   (cons blend2d.ll::+ERROR-READ-ONLY-FS+ '+ERROR-READ-ONLY-FS+)
   (cons blend2d.ll::+ERROR-START-INDEX+ '+ERROR-START-INDEX+)
   (cons blend2d.ll::+ERROR-TOO-MANY-OPEN-FILES-BY-OS+ '+ERROR-TOO-MANY-OPEN-FILES-BY-OS+)
   (cons blend2d.ll::+ERROR-TIMED-OUT+ '+ERROR-TIMED-OUT+)
   (cons blend2d.ll::+ERROR-TOO-MANY-LINKS+ '+ERROR-TOO-MANY-LINKS+)
   (cons blend2d.ll::+ERROR-TOO-MANY-OPEN-FILES+ '+ERROR-TOO-MANY-OPEN-FILES+)
   (cons blend2d.ll::+ERROR-VALUE-TOO-LARGE+ '+ERROR-VALUE-TOO-LARGE+)
   (cons blend2d.ll::+ERROR-TOO-MANY-THREADS+ '+ERROR-TOO-MANY-THREADS+)
   (cons blend2d.ll::+ERROR-TRY-AGAIN+ '+ERROR-TRY-AGAIN+)
   (cons blend2d.ll::+ERROR-UNKNOWN-SYSTEM-ERROR+ '+ERROR-UNKNOWN-SYSTEM-ERROR+)))

;; TODO: Make this more efficient
(defmacro lookup-error (&body form)
  (alexandria:with-gensyms (rval)
    `(progn
       (when (> *log-level* 1) (format t "Calling ~a~%" (car (quote ,form))))
       (let ((,rval (progn ,@form)))
         (if (and (> *log-level* 0) (/= 0 ,rval))
             (format t "Blend2d Error: ~a ~a ~a~%" (car (quote ,form)) ,rval (cdr (assoc ,rval *error-lookup*)))
             (when (> *log-level* 1) (format t "No error from ~a~%" (quote ,form))))
         ,rval))))


(defun setup-window (ctx x-min x-max y-min y-max width height &optional (stroke-width nil))
  "Convenience function to setup a logical coordinate system with top-left coordinate (x-min y-min)
and bottom right coordinate (x-max y-max).  If stroke-width is non-nil then the stroke width is also transformed.
If stroke-width is t then a stroke width of 1.0 is transformed, otherwise stroke-width must be a number, which will be transformed into the new stroke-width."
  (let ((x-scale (/ width (- x-max x-min)))
        (y-scale (/ height (- y-max y-min)))
        (x-trans (- x-min))
        (y-trans (- y-min)))
    (cffi:with-foreign-array (arr (make-array 2 :initial-contents (list x-scale y-scale)) '(:array :double 2))
      (context-matrix-op ctx +matrix2d-op-scale+ arr)
      (when stroke-width
        (typecase stroke-width
          (number (context-set-stroke-width ctx (* stroke-width (cffi:foreign-aref arr '(:array :double 2) 0))))
          (t (context-set-stroke-width ctx (* 1.0 (cffi:foreign-aref arr '(:array :double 2) 0)))))))

    (cffi:with-foreign-array (arr (make-array 2 :initial-contents (list x-trans y-trans)) '(:array :double 2))
      (context-matrix-op ctx +matrix2d-op-translate+ arr))))

(declaim (inline 3d-to-2d))
(defun 3d-to-2d (x y z theta gamma)
  (values (- (* y (cos theta)) (* x (sin theta)))
          (- (* z (sin gamma)) (* y (sin theta) (cos gamma)) (* x (sin theta) (cos gamma)))))
