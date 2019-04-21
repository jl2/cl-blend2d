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

(defun getting-started-2 (file-name &key (width 800) (height 800))
  (let ((img (autowrap:alloc 'blll:image-core))
        (ctx (autowrap:alloc 'blll:context-core))
        (path (autowrap:alloc 'blll:path-core))
        (codec (autowrap:alloc 'blll:image-codec-core))
        (linear (autowrap:alloc 'blll:linear-gradient-values))
        (grad (autowrap:alloc 'blll:gradient-core))
        (rect (autowrap:alloc 'blll:round-rect)))

    (blll:image-init-as img width height blll:+format-prgb32+)

    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (setf (blll:linear-gradient-values.x0 linear) 0.0)
    (setf (blll:linear-gradient-values.y0 linear) 0.0)
    (setf (blll:linear-gradient-values.x1 linear) 0.0)
    (setf (blll:linear-gradient-values.y1 linear) 480.0)

    (blll:gradient-init-as grad
                         blll:+gradient-type-linear+
                         linear
                         blll:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))
    (blll:gradient-add-stop-rgba32 grad 0.0 #16rffffffff)
    (blll:gradient-add-stop-rgba32 grad 0.5 #16rff5fafdf)
    (blll:gradient-add-stop-rgba32 grad 1.0 #16rff2f5fdf)

    (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
    (blll:context-set-fill-style ctx grad)
    (setf (blll:round-rect.x rect) 40.0)
    (setf (blll:round-rect.y rect) 40.0)
    (setf (blll:round-rect.w rect) 400.0)
    (setf (blll:round-rect.h rect) 400.0)
    (setf (blll:round-rect.radius.x rect) 45.0)
    (setf (blll:round-rect.radius.y rect) 45.0)

    (blll:context-fill-geometry ctx blll:+geometry-type-round-rect+ rect)
    (blll:context-end ctx)

    
    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))

    (blll:image-write-to-file img file-name codec)

    (autowrap:free rect)
    (autowrap:free grad)
    (autowrap:free codec)
    (autowrap:free path)
    (autowrap:free img)
    (autowrap:free ctx)))
