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


(defmacro define-cfun ((c-name name) return-type &body body)
  `(progn
     (defun ,name ,(loop for p in body
                      with optional = nil
                      with a = () with b = ()
                      do (if (= (length p) 2) (progn
                                                (when optional (error "why not optional?"))
                                                (push (car p) a))
                             (progn
                               (setf optional t)
                               (push (list (car p) (third p)) b)))
                      finally (return (append (reverse a) (cons '&optional (reverse b)))))
       (cffi:foreign-funcall
        ,c-name
        ,@(mapcan
           #'(lambda (p)
               (destructuring-bind (var type &rest r)
                   p
                 (declare (ignore r))
                 (list type (case type
                              (:float `(coerce ,var 'single-float))
                              (:double `(coerce ,var 'double-float))
                              (:int `(floor ,var))
                              (otherwise var)))))
           body)
        ,return-type))
     (export ',name)))

