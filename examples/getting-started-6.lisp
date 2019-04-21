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

(defun getting-started-6 (file-name &key (width 480) (height 480))
  (let ((img (autowrap:alloc 'blll:image-core))
        (ctx (autowrap:alloc 'blll:context-core))
        (path (autowrap:alloc 'blll:path-core))
        (codec (autowrap:alloc 'blll:image-codec-core))
        (linear (autowrap:alloc 'blll:linear-gradient-values))
        (grad (autowrap:alloc 'blll:gradient-core)))

    (blll:image-init-as img width height blll:+format-prgb32+)

    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (setf (blll:linear-gradient-values.x0 linear) 0.0d0)
    (setf (blll:linear-gradient-values.y0 linear) 0.0d0)
    (setf (blll:linear-gradient-values.x1 linear) 0.0d0)
    (setf (blll:linear-gradient-values.y1 linear) 480.0d0)

    (blll:gradient-init-as grad
                         blll:+gradient-type-linear+
                         linear
                         blll:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer))
    (blll:gradient-add-stop-rgba32 grad 0.0d0 #16rffffffff)
    (blll:gradient-add-stop-rgba32 grad 1.0d0 #16rff1f7fff)


    (blll:path-init path)
    (blll:path-move-to path 119.0d0 49.0d0)
    (blll:path-cubic-to path
                      259.0d0 29.0d0
                      99.0d0 279.0d0
                      275.0d0 267.0d0)
    (blll:path-cubic-to path
                      537.0d0 245.0d0
                      300.0d0 -170.0d0
                      274.0d0 430.0d0)

    (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
    (blll:context-set-stroke-style ctx grad)
    (blll:context-set-stroke-width ctx 15.0d0)
    (blll:context-set-stroke-cap ctx blll:+stroke-cap-position-start+ blll:+stroke-cap-round+)
    (blll:context-set-stroke-cap ctx blll:+stroke-cap-position-end+ blll:+stroke-cap-butt+)
    #+sbcl (sb-int:with-float-traps-masked (:invalid) (blll:context-stroke-geometry ctx blll:+geometry-type-path+ path))
    #-sbcl (blll:context-stroke-geometry ctx blll:+geometry-type-path+ path)

    (blll:context-end ctx)

    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))

    (blll:image-write-to-file img file-name codec)

    (autowrap:free grad)
    (autowrap:free linear)
    (autowrap:free codec)
    (autowrap:free path)
    (autowrap:free img)
    (autowrap:free ctx)))
