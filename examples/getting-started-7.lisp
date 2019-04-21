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

(defun getting-started-7 (file-name &key (font-file-name "NotoSans-Regular.ttf") (width 480) (height 480))
  (bl:with-objects ((img  'bl:image-core)
                    (ctx  'bl:context-core)
                    (codec  'bl:image-codec-core)
                    (font 'bl:font-core)
                    (face 'bl:font-face-core)
                    (point 'bl:point-i))

    (bl:image-init-as img width height bl:+format-prgb32+)

    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)

    (bl:font-face-init face)
    (bl:font-face-create-from-file face font-file-name)
    (bl:font-init font)
    (bl:font-create-from-face font face 50.0f0)

    (bl:context-set-fill-style-rgba32 ctx #16rffffffff)

    (setf (bl:point-i.x point) 60)
    (setf (bl:point-i.y point) 80)

    (cffi:with-foreign-string (str "Hello Blend2D!")
      (bl:context-fill-text-i ctx point font str bl:+size-max+ bl:+text-encoding-utf8+))

    (cffi:with-foreign-array (arr #(0.785398d0) '(:array :double 1))
      (bl:context-matrix-op ctx bl:+matrix2d-op-rotate+ arr))

    (setf (bl:point-i.x point) 250)
    (setf (bl:point-i.y point) 80)

    (cffi:with-foreign-string (str "Rotated Text!")
      (bl:context-fill-text-i ctx point font str bl:+size-max+ bl:+text-encoding-utf8+))
    (bl:context-end ctx)

    (bl:image-codec-init codec)
    (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (bl:image-write-to-file img file-name codec)))
