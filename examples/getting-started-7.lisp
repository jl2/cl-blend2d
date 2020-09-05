;;;; getting-started-7.lisp
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

(in-package :blend2d.examples)

(defun getting-started-7 (file-name &key (font-file-name "NotoSans-Regular.ttf") (width 480) (height 480) (image-type "BMP"))
  (bl:with-image-context*
      (img ctx file-name :width width :height height :codec-name image-type)
      ((font bl:font-core)
       (face bl:font-face-core)
       (point bl:point-i))

    (bl:lookup-error (bl:font-face-init face))
    (bl:lookup-error (bl:font-face-create-from-file face font-file-name 0))
    (bl:lookup-error (bl:font-init font))
    (bl:lookup-error (bl:font-create-from-face font face 50.0f0))

    (bl:lookup-error (bl:context-set-fill-style-rgba32 ctx #16rffffffff))

    (setf (bl:point-i.x point) 60)
    (setf (bl:point-i.y point) 80)

    (cffi:with-foreign-string (str "Hello Blend2D!")
      (bl:lookup-error (bl:context-fill-text-i  ctx point font str 15 bl:+text-encoding-utf8+)))

    (cffi:with-foreign-array (arr #(0.785398d0) '(:array :double 1))
      (bl:lookup-error (bl:context-matrix-op ctx bl:+matrix2d-op-rotate+ arr)))

    (setf (bl:point-i.x point) 250)
    (setf (bl:point-i.y point) 80)

    (cffi:with-foreign-string (str "Rotated Text!")
      (bl:lookup-error (bl:context-fill-text-i ctx point font str 14 bl:+text-encoding-utf8+)))))
