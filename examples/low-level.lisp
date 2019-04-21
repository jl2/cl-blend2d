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
  (let ((img (autowrap:alloc 'blll:image-core))
        (ctx (autowrap:alloc 'blll:context-core))
        (circle (autowrap:alloc 'blll:circle)))
    (blll:image-init-as img width height blll:+format-prgb32+)
    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)
    (dotimes (i count)
      (let* ((sx (random (coerce width 'double-float)))
             (sy (random (coerce height 'double-float)))
             (radius (random max-radius)))
        (setf (blll:circle.cx circle) sx)
        (setf (blll:circle.cy circle) sy)
        (setf (blll:circle.r circle) radius)
        (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
        (blll:context-set-fill-style-rgba32 ctx (random #16rffffffff))
        (blll:context-fill-geometry ctx blll:+geometry-type-circle+ circle)))
    (blll:context-end ctx)
    (let ((codec (autowrap:alloc 'blll:image-codec-core)))
      (blll:image-codec-init codec)
      (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
      (when (uiop/filesystem:file-exists-p file-name)
        (delete-file file-name))
      (blll:image-write-to-file img (format nil file-name count) codec)
      (autowrap:free codec))
    (autowrap:free circle)
    (autowrap:free img)
    (autowrap:free ctx)))

(defun random-lines (count file-name &key (width 1600) (height 1600) (max-width 16.0))
  (ensure-directories-exist file-name)
  (let ((img (autowrap:alloc 'blll:image-core))
        (ctx (autowrap:alloc 'blll:context-core))
        (line (autowrap:alloc 'blll:line))
        (fwidth (coerce width 'double-float))
        (fheight (coerce height 'double-float)))
    (blll:image-init-as img width height blll:+format-prgb32+)
    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)
    (dotimes (i count)
      (setf (blll:line.p0.x line) (random fwidth))
      (setf (blll:line.p1.x line) (random fwidth))

      (setf (blll:line.p0.y line) (random fheight))
      (setf (blll:line.p1.y line) (random fheight))
      (blll:context-set-stroke-width ctx  (random max-width))
      (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
      (blll:context-set-stroke-style-rgba32 ctx (random #16rffffffff))
      (blll:context-stroke-geometry ctx blll:+geometry-type-line+ line))
    (blll:context-end ctx)

    (let ((codec (autowrap:alloc 'blll:image-codec-core)))
      (blll:image-codec-init codec)
      (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
      (when (uiop/filesystem:file-exists-p file-name)
        (delete-file file-name))
      (blll:image-write-to-file img (format nil file-name count) codec)
      (autowrap:free codec))
    (autowrap:free line)
    (autowrap:free img)
    (autowrap:free ctx)))
