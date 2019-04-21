;;;; getting-started-3.lisp
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

(defun getting-started-3 (file-name &key (texture-file-name "texture.jpeg") (width 800) (height 800))
  (bl:with-objects ((img  'bl:image-core)
                    (texture  'bl:image-core)
                    (pattern  'bl:pattern-core)
                    (ctx  'bl:context-core)
                    (codec  'bl:image-codec-core)
                    (matrix  'bl:matrix2d)
                    (rect  'bl:round-rect))

    (bl:image-init-as img width height bl:+format-prgb32+)

    (bl:context-init-as ctx img (cffi:null-pointer))
    (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
    (bl:context-fill-all ctx)

    (bl:matrix2d-set-identity matrix)
    (bl:image-read-from-file texture texture-file-name (bl:image-codec-built-in-codecs))

    (bl:pattern-init-as pattern texture (cffi:null-pointer) bl:+extend-mode-repeat+ matrix)
    (bl:context-set-fill-style ctx pattern)

    (bl:context-set-comp-op ctx bl:+comp-op-src-over+)

    (setf (bl:round-rect.x rect) 40.0)
    (setf (bl:round-rect.y rect) 40.0)
    (setf (bl:round-rect.w rect) 400.0)
    (setf (bl:round-rect.h rect) 400.0)
    (setf (bl:round-rect.rx rect) 45.0)
    (setf (bl:round-rect.ry rect) 45.0)
    (bl:context-fill-geometry ctx bl:+geometry-type-round-rect+ rect)
    (bl:context-end ctx)
    (bl:image-codec-init codec)
    (bl:image-codec-find-by-name codec (bl:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (bl:image-write-to-file img file-name codec)))
