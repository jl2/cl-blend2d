;;;; blend2d.lisp 
;;
;; Copyright (c) 2019 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


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

(defmacro with-objects ((&rest object-definitions) &body body)
  (alexandria:with-gensyms (result)
    (let ((alloc-defs (mapcar (lambda (def)
                                (list (car def) (list 'autowrap:alloc (list 'quote (cadr def)))))
                              object-definitions))
          (free-calls (reverse (mapcar (lambda (def)
                                         (list 'progn
                                               (let* ((type-name (string (cadr def)))
                                                      (len-m-5 (- (length type-name) 5)))
                                                 (when (and (> (length type-name) 6)
                                                            (string= (subseq type-name len-m-5) "-CORE"))
                                                   (list
                                                    (intern (format nil "~a-RESET" (subseq type-name 0 len-m-5)) 'blll)
                                                    (car def))))
                                               (list 'autowrap:free (car def))))
                                       object-definitions))))
      `(let (,@alloc-defs
             (,result nil))
         (handler-case
             (setf ,result (progn
                             ,@body))
           (t (err)
             (format t "Caught ~a~%" err)))
         ,@free-calls
         ,result))))

