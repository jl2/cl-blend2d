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
  (let ((img  (autowrap:alloc 'blll:image-core))
        (ctx  (autowrap:alloc 'blll:context-core))
        (codec  (autowrap:alloc 'blll:image-codec-core))

        (radial-vals (autowrap:alloc 'blll:radial-gradient-values))
        (linear-vals (autowrap:alloc 'blll:linear-gradient-values))
        (rad-grad (autowrap:alloc 'blll:gradient-core))
        (lin-grad (autowrap:alloc 'blll:gradient-core))

        (circle  (autowrap:alloc 'blll:circle))
        (rect  (autowrap:alloc 'blll:round-rect)))

    ;; Initialize and clear image
    (blll:image-init-as img width height blll:+format-prgb32+)
    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (setf (blll:radial-gradient-values.x0 radial-vals) 180.0)
    (setf (blll:radial-gradient-values.y0 radial-vals) 180.0)
    (setf (blll:radial-gradient-values.x1 radial-vals) 180.0)
    (setf (blll:radial-gradient-values.y1 radial-vals) 180.0)
    (setf (blll:radial-gradient-values.r0 radial-vals) 180.0)
    (blll:gradient-init-as rad-grad
                         blll:+gradient-type-radial+
                         radial-vals
                         blll:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))

    (blll:gradient-add-stop-rgba32 rad-grad 0.0 #16rffffffff)
    (blll:gradient-add-stop-rgba32 rad-grad 1.0 #16rffff6f3f)

    (setf (blll:circle.center.x circle) 180.0)
    (setf (blll:circle.center.y circle) 180.0)
    (setf (blll:circle.r circle) 160.0)
    (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
    (blll:context-set-fill-style ctx rad-grad)
    (blll:context-fill-geometry ctx blll:+geometry-type-circle+ circle)

    
    (setf (blll:linear-gradient-values.x0 linear-vals) 195.0)
    (setf (blll:linear-gradient-values.y0 linear-vals) 195.0)
    (setf (blll:linear-gradient-values.x1 linear-vals) 470.0)
    (setf (blll:linear-gradient-values.y1 linear-vals) 470.0)

    (blll:gradient-init-as lin-grad
                         blll:+gradient-type-linear+
                         linear-vals
                         blll:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))
    (blll:gradient-add-stop-rgba32 lin-grad 0.0 #16rffffffff)
    (blll:gradient-add-stop-rgba32 lin-grad 1.0 #16rff3f9fff)

    (setf (blll:round-rect.x rect) 195.0)
    (setf (blll:round-rect.y rect) 195.0)
    (setf (blll:round-rect.w rect) 270.0)
    (setf (blll:round-rect.h rect) 270.0)
    (setf (blll:round-rect.radius.x rect) 25.0)
    (setf (blll:round-rect.radius.y rect) 25.0)

    (blll:context-set-comp-op ctx blll:+comp-op-difference+)
    (blll:context-set-fill-style ctx lin-grad)

    (blll:context-fill-geometry ctx blll:+geometry-type-round-rect+ rect)
    (blll:context-end ctx)
    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (blll:image-write-to-file img file-name codec)

    (autowrap:free rect)
    (autowrap:free circle)
    (autowrap:free radial-vals)
    (autowrap:free linear-vals)
    (autowrap:free rad-grad)
    (autowrap:free lin-grad)
    (autowrap:free codec)
    (autowrap:free img)
    (autowrap:free ctx)))
