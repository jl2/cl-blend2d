;;;; getting-started-2.lisp
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

(defun getting-started-2 (file-name &key (width 800) (height 800) (image-type "PNG"))
  (ensure-directories-exist file-name)
  (bl:with-image-context* (img ctx file-name
                               :width width
                               :height height
                               :codec-name image-type)
      ((path path-core)
       (linear linear-gradient-values)
       (grad gradient-core)
       (rect round-rect))

    (setf (bl:linear-gradient-values.x0 linear) 0.0)
    (setf (bl:linear-gradient-values.y0 linear) 0.0)
    (setf (bl:linear-gradient-values.x1 linear) 0.0)
    (setf (bl:linear-gradient-values.y1 linear) 480.0)

    (bl:gradient-init-as grad
                         bl:+gradient-type-linear+
                         linear
                         bl:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))
    (bl:gradient-add-stop-rgba32 grad 0.0 #16rffffffff)
    (bl:gradient-add-stop-rgba32 grad 0.5 #16rff5fafdf)
    (bl:gradient-add-stop-rgba32 grad 1.0 #16rff2f5fdf)

    (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
    (bl:context-set-fill-style ctx grad)
    (setf (bl:round-rect.x rect) 40.0)
    (setf (bl:round-rect.y rect) 40.0)
    (setf (bl:round-rect.w rect) 400.0)
    (setf (bl:round-rect.h rect) 400.0)
    (setf (bl:round-rect.rx rect) 45.0)
    (setf (bl:round-rect.ry rect) 45.0)

    (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect)))
