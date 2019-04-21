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

(defun getting-started-7 (file-name &key (texture-file-name "texture.jpeg") (width 800) (height 800))
  (let ((img  (autowrap:alloc 'bl:image-core))
        (texture  (autowrap:alloc 'bl:image-core))
        (pattern  (autowrap:alloc 'bl:pattern-core))
        (ctx  (autowrap:alloc 'bl:context-core))
        (codec  (autowrap:alloc 'bl:image-codec-core))
        (matrix  (autowrap:alloc 'bl:matrix2d))
        (rect  (autowrap:alloc 'bl:round-rect)))

    (bl:image-init-as img width height bl:+format-prgb32+)

    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)

    (bl:matrix2d-set-identity matrix)
    (bl:image-read-from-file texture texture-file-name (bl:image-codec-built-in-codecs))

    (bl:pattern-init-as pattern texture (cffi:null-pointer) bl:+extend-mode-repeat+ matrix)
    (bl:context-set-fill-style ctx pattern)

    (cffi:with-foreign-array (arr #(0.785398 240.0 240.0) '(:array :double 3))
      (bl:context-matrix-op ctx bl:+matrix2d-op-rotate-pt+ arr))
    
    (bl:context-set-comp-op ctx bl:+comp-op-src-over+)

    (setf (bl:round-rect.x rect) 40.0)
    (setf (bl:round-rect.y rect) 40.0)
    (setf (bl:round-rect.w rect) 400.0)
    (setf (bl:round-rect.h rect) 400.0)
    (setf (bl:round-rect.radius.x rect) 45.0)
    (setf (bl:round-rect.radius.y rect) 45.0)

    (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect)
    (bl:context-end ctx)
    (bl:image-codec-init codec)
    (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (bl:image-write-to-file img file-name codec)

    (autowrap:free rect)
    (autowrap:free matrix)
    (autowrap:free codec)
    (autowrap:free texture)
    (autowrap:free img)
    (autowrap:free ctx)))
