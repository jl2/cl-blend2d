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
  (let ((img  (autowrap:alloc 'blll:image-core))
        (ctx  (autowrap:alloc 'blll:context-core))
        (codec  (autowrap:alloc 'blll:image-codec-core))
        (font (autowrap:alloc 'blll:font-core))
        (face (autowrap:alloc 'blll:font-face-core))
        (point (autowrap:alloc 'blll:point-i)))

    (blll:image-init-as img width height blll:+format-prgb32+)

    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (blll:font-face-init face)
    (blll:font-face-create-from-file face font-file-name)
    (blll:font-init font)
    (blll:font-create-from-face font face 50.0f0)

    (blll:context-set-fill-style-rgba32 ctx #16rffffffff)

    (setf (blll:point-i.x point) 60)
    (setf (blll:point-i.y point) 80)

    (cffi:with-foreign-string (str "Hello Blend2D!")
      (blll:context-fill-text-i ctx point font str blll:+size-max+ blll:+text-encoding-utf8+))

    (cffi:with-foreign-array (arr #(0.785398d0) '(:array :double 1))
      (blll:context-matrix-op ctx blll:+matrix2d-op-rotate+ arr))

    (setf (blll:point-i.x point) 250)
    (setf (blll:point-i.y point) 80)

    (cffi:with-foreign-string (str "Rotated Text!")
      (blll:context-fill-text-i ctx point font str blll:+size-max+ blll:+text-encoding-utf8+))
    (blll:context-end ctx)

    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (blll:image-write-to-file img file-name codec)

    (autowrap:free point)
    (autowrap:free font)
    (autowrap:free face)
    (autowrap:free codec)
    (autowrap:free img)
    (autowrap:free ctx)))
