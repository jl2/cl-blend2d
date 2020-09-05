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

(defun getting-started-4 (file-name &key
                                      (texture-file-name "texture.jpeg")
                                      (width 800)
                                      (height 800)
                                      (image-type "BMP"))
  (bl:with-image-context*
      (img ctx file-name :width width :height height :codec-name image-type)
      ((texture  bl:image-core)
       (pattern  bl:pattern-core)
       (matrix  bl:matrix2d)
       (rect  bl:round-rect))


    (bl:lookup-error (bl:matrix2d-set-identity matrix))

    (bl:lookup-error (bl:image-init texture))
    (bl:lookup-error (bl:image-read-from-file texture texture-file-name (cffi:null-pointer)))

    (bl:lookup-error (bl:pattern-init-as pattern texture (cffi:null-pointer) bl:+extend-mode-repeat+ matrix))

    (cffi:with-foreign-array (arr #(0.785398d0 240.0d0 240.0d0) '(:array :double 3))
      (bl:lookup-error (bl:context-matrix-op ctx bl:+matrix2d-op-rotate-pt+ arr)))
    
    (bl:lookup-error (bl:context-set-comp-op ctx bl:+comp-op-src-over+))
    (bl:lookup-error (bl:context-set-fill-style-object ctx pattern))

    (setf (bl:round-rect.x rect) 50.0d0)
    (setf (bl:round-rect.y rect) 50.0d0)
    (setf (bl:round-rect.w rect) 380.0d0)
    (setf (bl:round-rect.h rect) 380.0d0)
    (setf (bl:round-rect.rx rect) 80.5d0)
    (setf (bl:round-rect.ry rect) 80.5d0)

    (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect)))
