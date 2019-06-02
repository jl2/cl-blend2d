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

(defun getting-started-1 (file-name &key (width 800) (height 800) (image-type "BMP"))
  (ensure-directories-exist file-name)
  (bl:with-image-context*
      (img ctx file-name
           :codec-name image-type
           :width width
           :height height)
      ((path path-core))
      
    (bl:path-init path)
    (bl:path-move-to path 26.0 31.0)
    (bl:path-cubic-to path 642.0 132.0 587.0 -136.0 25.0 464.0)
    (bl:path-cubic-to path 882.0 404.0 144.0 267.0 27.0 31.0)

    (bl:context-set-comp-op ctx bl:+comp-op-src-over+)
    (bl:context-set-fill-style-rgba32 ctx #16rffffffff)
    (bl:context-fill-path-d ctx path)))

