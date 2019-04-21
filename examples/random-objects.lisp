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
  (ensure-directories-exist file-name)
  (bl:with-objects ((img 'bl:image-core)
                    (ctx 'bl:context-core)
                    (circle 'bl:circle)
                    (codec 'bl:image-codec-core))

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
    (bl:image-codec-init codec)
    (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")

    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))

    (bl:image-write-to-file img (format nil file-name count) codec)))

(defun random-lines (count file-name &key (width 1600) (height 1600) (max-width 16.0))
  (ensure-directories-exist file-name)
  (bl:with-objects ((img 'bl:image-core)
                    (ctx 'bl:context-core)
                    (line 'bl:line)
                    (codec 'bl:image-codec-core))

    (let ((fwidth (coerce width 'double-float))
          (fheight (coerce height 'double-float)))
      (bl:image-init-as img width height bl:+format-prgb32+)
      (bl:context-init-as ctx img (cffi:null-pointer))
      (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
      (bl:context-fill-all ctx)
      (dotimes (i count)
        (setf (bl:line.p0.x line) (random fwidth))
        (setf (bl:line.p1.x line) (random fwidth))

        (setf (bl:line.p0.y line) (random fheight))
        (setf (bl:line.p1.y line) (random fheight))
        (bl:context-set-stroke-width ctx  (random max-width))
        (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
        (bl:context-set-stroke-style-rgba32 ctx (random #16rffffffff))
        (bl:context-stroke-geometry ctx bl:+geometry-type-line+ line))
      (bl:context-end ctx)

      (bl:image-codec-init codec)
      (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
      (when (uiop/filesystem:file-exists-p file-name)
        (delete-file file-name))
      (bl:image-write-to-file img (format nil file-name count) codec))))
