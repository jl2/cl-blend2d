;;;; getting-started-5.lisp
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

(defun getting-started-5 (file-name &key (width 480) (height 480))
  (let ((img  (autowrap:alloc 'bl:image-core))
        (ctx  (autowrap:alloc 'bl:context-core))
        (codec  (autowrap:alloc 'bl:image-codec-core))

        (radial-vals (autowrap:alloc 'bl:radial-gradient-values))
        (linear-vals (autowrap:alloc 'bl:linear-gradient-values))
        (rad-grad (autowrap:alloc 'bl:gradient-core))
        (lin-grad (autowrap:alloc 'bl:gradient-core))

        (circle  (autowrap:alloc 'bl:circle))
        (rect  (autowrap:alloc 'bl:round-rect)))

    ;; Initialize and clear image
    (bl:image-init-as img width height bl:+format-prgb32+)
    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)

    (setf (bl:radial-gradient-values.x0 radial-vals) 180.0)
    (setf (bl:radial-gradient-values.y0 radial-vals) 180.0)
    (setf (bl:radial-gradient-values.x1 radial-vals) 180.0)
    (setf (bl:radial-gradient-values.y1 radial-vals) 180.0)
    (setf (bl:radial-gradient-values.r0 radial-vals) 180.0)
    (bl:gradient-init-as rad-grad
                         bl:+gradient-type-radial+
                         radial-vals
                         bl:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))

    (bl:gradient-add-stop-rgba32 rad-grad 0.0 #16rffffffff)
    (bl:gradient-add-stop-rgba32 rad-grad 1.0 #16rffff6f3f)

    (setf (bl:circle.center.x circle) 180.0)
    (setf (bl:circle.center.y circle) 180.0)
    (setf (bl:circle.r circle) 160.0)
    (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
    (bl:context-set-fill-style ctx rad-grad)
    (bl:context-fill-geometry ctx bl:+geometry-type-circle+ circle)

    
    (setf (bl:linear-gradient-values.x0 linear-vals) 195.0)
    (setf (bl:linear-gradient-values.y0 linear-vals) 195.0)
    (setf (bl:linear-gradient-values.x1 linear-vals) 470.0)
    (setf (bl:linear-gradient-values.y1 linear-vals) 470.0)

    (bl:gradient-init-as lin-grad
                         bl:+gradient-type-linear+
                         linear-vals
                         bl:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))
    (bl:gradient-add-stop-rgba32 lin-grad 0.0 #16rffffffff)
    (bl:gradient-add-stop-rgba32 lin-grad 1.0 #16rff3f9fff)

    (setf (bl:round-rect.x rect) 195.0)
    (setf (bl:round-rect.y rect) 195.0)
    (setf (bl:round-rect.w rect) 270.0)
    (setf (bl:round-rect.h rect) 270.0)
    (setf (bl:round-rect.radius.x rect) 25.0)
    (setf (bl:round-rect.radius.y rect) 25.0)

    (bl:context-set-comp-op ctx bl:+comp-op-difference+)
    (bl:context-set-fill-style ctx lin-grad)

    (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect)
    (bl:context-end ctx)
    (bl:image-codec-init codec)
    (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (bl:image-write-to-file img file-name codec)

    (autowrap:free rect)
    (autowrap:free circle)
    (autowrap:free radial-vals)
    (autowrap:free linear-vals)
    (autowrap:free rad-grad)
    (autowrap:free lin-grad)
    (autowrap:free codec)
    (autowrap:free img)
    (autowrap:free ctx)))