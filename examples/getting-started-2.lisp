;;;; getting-started-1.lisp
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
  (let ((img (show-result (autowrap:alloc 'bl:image-core)))
        (ctx (show-result (autowrap:alloc 'bl:context-core)))
        (path (show-result (autowrap:alloc 'bl:path-core)))
        (codec (show-result (autowrap:alloc 'bl:image-codec-core)))
        (linear (show-result (autowrap:alloc 'bl:linear-gradient-values)))
        (grad (show-result (autowrap:alloc 'bl:gradient-core)))
        (rect (show-result (autowrap:alloc 'bl:round-rect))))

    (show-result (bl:image-init-as img width height bl:+format-prgb32+))

    (show-result (bl:context-init-as ctx img (cffi:null-pointer)))
    (show-result (bl:context-set-comp-op ctx bl:+comp-op-src-copy+))
    (show-result (bl:context-fill-all ctx))

    (setf (bl:linear-gradient-values.x0 linear) 0.0)
    (setf (bl:linear-gradient-values.y0 linear) 0.0)
    (setf (bl:linear-gradient-values.x1 linear) 0.0)
    (setf (bl:linear-gradient-values.y1 linear) 480.0)

    (show-result (bl:gradient-init-as grad
                                      bl:+gradient-type-linear+
                                      linear
                                      bl:+extend-mode-pad+ (cffi:null-pointer) 0  (cffi:null-pointer)))
    (show-result (bl:gradient-add-stop-rgba32 grad 0.0 #16rffffffff))
    (show-result (bl:gradient-add-stop-rgba32 grad 0.5 #16rff5fafdf))
    (show-result (bl:gradient-add-stop-rgba32 grad 1.0 #16rff2f5fdf))

    (show-result (bl:context-set-comp-op ctx bl:+comp-op-src-over+))
    (show-result (bl:context-set-fill-style ctx grad))
    (show-result (setf (bl:round-rect.x rect) 40.0))
    (show-result (setf (bl:round-rect.y rect) 40.0))
    (show-result (setf (bl:round-rect.w rect) 400.0))
    (show-result (setf (bl:round-rect.h rect) 400.0))
    (show-result (setf (bl:round-rect.radius.x rect) 90.0))
    (show-result (setf (bl:round-rect.radius.y rect) 90.0))

    (show-result (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect))
    (show-result (bl:context-end ctx))

    
    (show-result (bl:image-codec-init codec))
    (show-result (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP"))
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))

    (show-result (bl:image-write-to-file img file-name codec))

    (show-result (autowrap:free rect))
    (show-result (autowrap:free grad))
    (show-result (autowrap:free codec))
    (show-result (autowrap:free path))
    (show-result (autowrap:free img))
    (show-result (autowrap:free ctx))))
