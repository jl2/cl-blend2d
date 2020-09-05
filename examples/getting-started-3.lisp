;;;; getting-started-3.lisp
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

(defun getting-started-3 (file-name &key
                                      (texture-file-name "texture.jpeg")
                                      (width 800)
                                      (height 800)
                                      (image-type "BMP"))
  (ensure-directories-exist file-name)
  (bl:with-image-context*
      (img ctx file-name :width width :height height :codec-name image-type)
      ((texture  image-core)
       (pattern  pattern-core)
       (matrix  matrix2d)
       (rect  round-rect))
    (bl:lookup-error (bl:matrix2d-set-identity matrix))

    (bl:lookup-error (bl:image-init texture))
    (bl:lookup-error (bl:image-read-from-file texture texture-file-name (cffi:null-pointer)))

    (bl:lookup-error (bl:pattern-init-as pattern texture (cffi:null-pointer) bl:+extend-mode-repeat+ matrix))
    (bl:lookup-error (bl:context-set-fill-style-object  ctx pattern))

    (bl:lookup-error (bl:context-set-comp-op ctx bl:+comp-op-src-over+))

    (setf (bl:round-rect.x rect) 40.0d0)
    (setf (bl:round-rect.y rect) 40.0d0)
    (setf (bl:round-rect.w rect) 400.0d0)
    (setf (bl:round-rect.h rect) 400.0d0)
    (setf (bl:round-rect.rx rect) 45.0d0)
    (setf (bl:round-rect.ry rect) 45.0d0)
    (bl:lookup-error (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect))))
