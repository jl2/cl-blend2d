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

(defun getting-started-1 (file-name &key (width 800) (height 800))
  (ensure-directories-exist file-name)
  (let ((img (autowrap:alloc 'blll:image-core))
        (ctx (autowrap:alloc 'blll:context-core))
        (path (autowrap:alloc 'blll:path-core))
        (codec (autowrap:alloc 'blll:image-codec-core)))

    (blll:image-init-as img width height blll:+format-prgb32+)

    (blll:context-init-as ctx img (cffi:null-pointer))
    (blll:context-set-comp-op ctx blll:+comp-op-src-copy+)
    (blll:context-fill-all ctx)

    (blll:path-init path)
    (blll:path-move-to path 26.0 31.0)
    (blll:path-cubic-to path 642.0 132.0 587.0 -136.0 25.0 464.0)
    (blll:path-cubic-to path 882.0 404.0 144.0 267.0 27.0 31.0)

    (blll:context-set-comp-op ctx blll:+comp-op-src-over+)
    (blll:context-set-fill-style-rgba32 ctx #16rffffffff)
    (blll:context-fill-path-d ctx path)

    (blll:context-end ctx)

    (blll:image-codec-init codec)
    (blll:image-codec-find-by-name codec (blll:image-codec-built-in-codecs) "BMP")
    (when (uiop/filesystem:file-exists-p file-name)
      (delete-file file-name))
    (blll:image-write-to-file img file-name codec)

    (autowrap:free codec)
    (autowrap:free path)
    (autowrap:free img)
    (autowrap:free ctx)))
