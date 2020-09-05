;;;; getting-started-6.lisp
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

(defun getting-started-6 (file-name &key (width 480) (height 480) (image-type "BMP"))
  (bl:with-image-context*
      (img ctx file-name :width width :height height :codec-name image-type)
      ((path bl:path-core)
       (linear bl:linear-gradient-values)
       (grad bl:gradient-core))

    (setf (bl:linear-gradient-values.x0 linear) 0.0d0)
    (setf (bl:linear-gradient-values.y0 linear) 0.0d0)
    (setf (bl:linear-gradient-values.x1 linear) 0.0d0)
    (setf (bl:linear-gradient-values.y1 linear) 480.0d0)

    (bl:lookup-error (bl:gradient-init-as grad
                                          bl:+gradient-type-linear+
                                          linear
                                          bl:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer)))
    (bl:lookup-error (bl:gradient-add-stop-rgba32 grad 0.0d0 #16rffffffff))
    (bl:lookup-error (bl:gradient-add-stop-rgba32 grad 1.0d0 #16rff1f7fff))


    (bl:lookup-error (bl:path-init path))
    (bl:lookup-error (bl:path-move-to path 119.0d0 49.0d0))
    (bl:lookup-error (bl:path-cubic-to path
                                       259.0d0 29.0d0
                                       99.0d0 279.0d0
                                       275.0d0 267.0d0))
    (bl:lookup-error (bl:path-cubic-to path
                                       537.0d0 245.0d0
                                       300.0d0 -170.0d0
                                       274.0d0 430.0d0))

    (bl:lookup-error (bl:context-set-comp-op ctx bl:+comp-op-src-over+))
    (bl:lookup-error (bl:context-set-stroke-style-object ctx grad))
    (bl:lookup-error (bl:context-set-stroke-width ctx 15.0d0))
    (bl:lookup-error (bl:context-set-stroke-cap ctx bl:+stroke-cap-position-start+ bl:+stroke-cap-round+))
    (bl:lookup-error (bl:context-set-stroke-cap ctx bl:+stroke-cap-position-end+ bl:+stroke-cap-butt+))
    #+sbcl(sb-int:with-float-traps-masked (:invalid) (bl:lookup-error (bl:context-stroke-geometry ctx bl:+geometry-type-path+ path)))
    #-sbcl (bl:lookup-error (bl:context-stroke-geometry ctx bl:+geometry-type-path+ path))
    ))
