;;;; getting-started-4.lisp
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

(defun getting-started-4 (file-name &key (texture-file-name "texture.jpeg") (width 800) (height 800))
  (let ((img  (autowrap:alloc 'blll:image-core))
        (texture  (autowrap:alloc 'blll:image-core))
        (pattern  (autowrap:alloc 'blll:pattern-core))
        (ctx  (autowrap:alloc 'blll:context-core))
        (codec  (autowrap:alloc 'blll:image-codec-core))
        (matrix  (autowrap:alloc 'blll:matrix2d))
        (rect  (autowrap:alloc 'blll:round-rect)))

    (blll:image-init-as img width height blll:+format-prgb32+)

    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (blll:matrix2d-set-identity matrix)
    (blll:image-read-from-file texture texture-file-name (blll:image-codec-built-in-codecs))

    (blll:pattern-init-as pattern texture (cffi:null-pointer) blll:+extend-mode-repeat+ matrix)

    (cffi:with-foreign-array (arr #(0.785398 240.0 240.0) '(:array :double 3))
      (blll:context-matrix-op ctx blll:+matrix2d-op-rotate-pt+ arr))
    
    (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
    (blll:context-set-fill-style ctx pattern)

    (setf (blll:round-rect.x rect) 50.0)
    (setf (blll:round-rect.y rect) 50.0)
    (setf (blll:round-rect.w rect) 380.0)
    (setf (blll:round-rect.h rect) 380.0)
    (setf (blll:round-rect.radius.x rect) 80.5)
    (setf (blll:round-rect.radius.y rect) 80.5)

    (blll:context-fill-geometry ctx blll:+geometry-type-round-rect+ rect)
    (blll:context-end ctx)
    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (blll:image-write-to-file img file-name codec)

    (autowrap:free rect)
    (autowrap:free matrix)
    (autowrap:free codec)
    (autowrap:free texture)
    (autowrap:free img)
    (autowrap:free ctx)))
