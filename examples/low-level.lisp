;;;; low-level.lisp 
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

;; Example code showing how to use the low-level blend bindings.

(defun random-circles (count file-name &key (width 800) (height 800) (max-radius 80.0))
  (let ((img (autowrap:alloc 'bl:image-core))
        (ctx (autowrap:alloc 'bl:context-core))
        (circle (autowrap:alloc 'bl:circle)))
    (bl:image-init-as img width height bl:+format-prgb32+)
    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)
    (dotimes (i count)
      (let* ((sx (random (coerce width 'double-float)))
             (sy (random (coerce height 'double-float)))
             (radius (random max-radius)))
        (setf (bl:circle.cx circle) sx)
        (setf (bl:circle.cy circle) sy)
        (setf (bl:circle.r circle) radius)
        (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
        (bl:context-set-fill-style-rgba32 ctx (random #16rffffffff))
        (bl:context-fill-geometry ctx bl:+geometry-type-circle+ circle)))
    (bl:context-end ctx)
    (let ((codec (autowrap:alloc 'bl:image-codec-core)))
      (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
      (bl:image-write-to-file img (format nil file-name count) codec)
      (autowrap:free codec))
    (autowrap:free circle)
    (autowrap:free img)
    (autowrap:free ctx)))

(defun random-lines (count file-name &key (width 800) (height 800) (max-radius 80.0))
  (let ((img (autowrap:alloc 'bl:image-core))
        (ctx (autowrap:alloc 'bl:context-core))
        (circle (autowrap:alloc 'bl:circle)))
    (bl:image-init-as img width height bl:+format-prgb32+)
    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)
    (dotimes (i count)
      (let* ((sx (random (coerce width 'double-float)))
             (sy (random (coerce height 'double-float)))
             (radius (random max-radius)))
        (setf (bl:circle.cx circle) sx)
        (setf (bl:circle.cy circle) sy)
        (setf (bl:circle.r circle) radius)
        (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
        (bl:context-set-fill-style-rgba32 ctx (random #16rffffffff))
        (bl:context-fill-geometry ctx bl:+geometry-type-circle+ circle)))
    (bl:context-end ctx)
    (let ((codec (autowrap:alloc 'bl:image-codec-core)))
      (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
      (bl:image-write-to-file img (format nil file-name count) codec)
      (autowrap:free codec))
    (autowrap:free circle)
    (autowrap:free img)
    (autowrap:free ctx)))
