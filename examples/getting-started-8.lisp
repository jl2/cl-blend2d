;;;; getting-started-7.lisp
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

(defun getting-started-8 (file-name &key (font-file-name "NotoSans-Regular.ttf") (width 480) (height 480))
  ;; (bl:with-objects ((img  image-core)
  ;;                   (ctx  context-core)
  ;;                   (codec  image-codec-core)
  ;;                   (font font-core)
  ;;                   (face font-face-core)
  ;;                   (fm font-metrics)
  ;;                   (tm text-metrics)
  ;;                   (gb glyph-buffer-core)
  ;;                   (point point-i))

  ;;   (bl:image-init-as img width height bl:+format-prgb32+)

  ;;   (bl:context-init-as ctx img (cffi:null-pointer))
  ;;   (bl:context-set-comp-op ctx bl:+comp-op-src-copy+)
  ;;   (bl:context-fill-all ctx)

  ;;   (bl:font-face-init face)
  ;;   (bl:font-face-create-from-file face font-file-name 0)

  ;;   (bl:font-init font)
  ;;   (bl:font-create-from-face font face 20.0f0)

  ;;   (bl:context-set-fill-style-rgba32 ctx #16rffffffff)

  ;;   (setf (bl:point-i.x point) 20)
  ;;   (setf (bl:point-i.y point) (floor (+ 190 (bl:font-metrics.ascent fm))))

  ;;   (bl:glyph-buffer-init gb)
  ;;   ;; (let ((strings (list
  ;;   ;;                 "Hello Blend2D!"
  ;;   ;;                 "This is a multiline text example"
  ;;   ;;                 "nthat uses BLGlyphBuffer and fillGlyphRun!")))
  ;;   ;;   (dolist (str strings)
  ;;   ;;     (cffi:with-foreign-string (c-str str)
  ;;   ;;       (bl:glyph-buffer-set-text gb c-str (length str) bl:+text-encoding-utf8+)
  ;;   ;;       (bl:font-shape font gb)
  ;;   ;;       (bl:font-get-text-metrics font gb tm)
  ;;   ;;       (setf (bl:point-i.x point)
  ;;   ;;             (floor (/ (- 480 (- (bl:text-metrics.bounding-box.x1 tm) (bl:text-metrics.bounding-box.x0 tm))) 2)))
  ;;   ;;       #+sbcl (sb-int:with-float-traps-masked (:invalid) (bl:context-fill-glyph-run-i ctx point font (bl:glyph-buffer-core.data*.glyph-run gb)))
  ;;   ;;       #-sbcl (bl:context-fill-glyph-run-i ctx point font (bl:glyph-buffer-core.data*.glyph-run gb))
  ;;   ;;       (incf (bl:point-i.y point)
  ;;   ;;             (floor (+ (bl:font-metrics.ascent fm) (bl:font-metrics.descent fm) (bl:font-metrics.line-gap fm))))))

  ;;   ;; (bl:context-end ctx)

  ;;   ;; (bl:image-codec-init codec)
  ;;   ;; (bl:image-codec-find-by-name codec "BMP" 200 (cffi:null-pointer))
  ;;   ;; (when (uiop/filesystem:file-exists-p file-name)
  ;;   ;;   (delete-file file-name))
  ;;   ;; (bl:image-write-to-file img file-name codec))
  ;;   )
  )
