;; random-objects.lisp
;; Copyright (c) 2023 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>

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

;; Example code showing how to use the low-level blend bindings.

(defun random-circles (count file-name &key (width 800) (height 800) (max-radius 80.0d0))
  (ensure-directories-exist file-name)
  (bl:with-image-context*
      (img ctx file-name
           :codec-name "BMP"
           :width width
           :height height)
      ((circle bl:circle))
    (dotimes (i count)
      (let* ((sx (random (coerce width 'double-float)))
             (sy (random (coerce height 'double-float)))
             (radius (random max-radius)))
        (setf (bl:circle.cx circle) sx)
        (setf (bl:circle.cy circle) sy)
        (setf (bl:circle.r circle) radius)
        (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
        (bl:context-set-fill-style-rgba32 ctx (random #16rffffffff))
        (bl:context-fill-geometry ctx bl:+geometry-type-circle+ circle)))))


(defun random-lines (count file-name &key (width 1600) (height 1600) (max-width 16.0d0))
  (ensure-directories-exist file-name)
  (bl:with-image-context*
      (img ctx file-name
           :codec-name "BMP"
           :width width
           :height height)
      ((line bl:line))


          (fheight (coerce height 'double-float)))
      (dotimes (i count)
        (setf (bl:line.x0 line) (random fwidth))
        (setf (bl:line.y0 line) (random fheight))

        (setf (bl:line.x1 line) (random fwidth))
        (setf (bl:line.y1 line) (random fheight))

        (bl:context-set-stroke-width ctx  (random max-width))
        (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
        (bl:context-set-stroke-style-rgba32 ctx (random #16rffffffff))
        (bl:context-stroke-geometry ctx bl:+geometry-type-line+ line)))
