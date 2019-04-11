;;;; package.lisp
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

(in-package :cl-user)
(defpackage :blend2d.test
  (:use :cl
        :fiveam
        :alexandria
        :blend2d))

(in-package :blend2d.test)

(def-suite :blend2d)
(in-suite :blend2d)


;; This is a Common Lisp version of the Blend2d C API sample code
;; The original source code is available here:
;; https://github.com/blend2d/bl-samples/blob/master/src/bl-capi-sample.c

(test capi-sample
  ;;  #include <blend2d.h>

  ;; int main(int argc, char* argv[]) {

  ;;   BLImageCore img;
  ;;   BLContextCore ctx;
  ;;   BLGradientCore gradient;
  (let ((img (bl:make-image-core))
        (ctx (bl:make-context-core))
        (gradient (bl:make-graient-core))
        (values (bl:make-gradient-values 0 0 256 256)))

    ;;   r = blImageInitAs(&img, 256, 256, BL_FORMAT_PRGB32);
    ;;   if (r != BL_SUCCESS)
    ;;     return 1;
    (bl:image-init-as img 256 256 :prgb32)

    ;;   r = blContextInitAs(&ctx, &img, NULL);
    ;;   if (r != BL_SUCCESS)
    ;;     return 1;
    (bl:context-init-as ctx img)

    ;;   BLLinearGradientValues values = { 0, 0, 256, 256 };
    ;;   r = blGradientInitAs(&gradient,
    ;;     BL_GRADIENT_TYPE_LINEAR, &values,
    ;;     BL_EXTEND_MODE_PAD, NULL, 0, NULL);
    ;;   if (r != BL_SUCCESS)
    ;;     return 1;
    (bl:gradient-init-as gradient
                         :gradient-type-linear values
                         :extend-mode-pad nil 0 nil)

    ;;   blGradientAddStopRgba32(&gradient, 0.0, 0xFFFFFFFFu);
    (bl:gradient-add-stop-rgb32 gradient 0.0 #16rFFFFFF00)

    ;;   blGradientAddStopRgba32(&gradient, 0.5, 0xFFFFAF00u);
    (bl:gradient-add-stop-rgb32 gradient 0.5 #16rFFFFAF00)

    ;;   blGradientAddStopRgba32(&gradient, 1.0, 0xFFFF0000u);
    (bl:gradient-add-stop-rgb32 gradient 1.0 #16rFFFF0000)

    ;;   blContextSetFillStyle(&ctx, &gradient);
    (bl:context-set-fill-style ctx gradient)

    ;;   blContextFillAll(&ctx);
    (bl:context-fill-all ctx)

    ;;   blGradientReset(&gradient);
    (bl:gradient-reset gradient)

    ;;   BLCircle circle;
    ;;   circle.cx = 128;
    ;;   circle.cy = 128;
    ;;   circle.r = 64;
    (let ((circle (bl:make-circle :cx 128 :cy 128 :r 64)))
      ;;   blContextSetCompOp(&ctx, BL_COMP_OP_EXCLUSION);
      (bl:context-set-comp-op ctx :comp-op-exclusion)

      ;;   blContextSetFillStyleRgba32(&ctx, 0xFF00FFFFu);
      (bl:context-set-fill-style-rgba32 ctx #16rFF00FFFF)

      ;;   blContextFillGeometry(&ctx, BL_GEOMETRY_TYPE_CIRCLE, &circle);
      (bl:context-fill-geometry ctx :geometry-type-circle circle)

      ;;   blContextEnd(&ctx);
      (bl:context-end)

      ;;   BLImageCodecCore codec;
      (let ((codec (bl:make-image-codec-core)))
        ;;   blImageCodecInit(&codec);
        (bl:image-codec-init codec)

        ;;   blImageCodecFindByName(&codec, blImageCodecBuiltInCodecs(), "BMP");
        (bl:image-codec-find-by-name  (bl:image-codec-build-in-codecs) "BMP")
        ;;   blImageWriteToFile(&img, "bl-capi-sample.bmp", &codec);
        (bl:image-write-to-file img "bl-capi-sample.bmp" codec)

        ;;   blImageCodecReset(&codec);
        (bl:image-codec-reset codec))))
  ;;   blImageReset(&img);
  (bl:image-reset img))
