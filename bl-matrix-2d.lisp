;;;; bl-matrix-2d.lisp

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

;; From https://blend2d.com/api/group__blend2d__api__c__functions.html

 ;; BLMatrix2D  
 ;; BLResult   blMatrix2DSetIdentity (BLMatrix2D *self)  
 ;; BLResult   blMatrix2DSetTranslation (BLMatrix2D *self, double x, double y)  
 ;; BLResult   blMatrix2DSetScaling (BLMatrix2D *self, double x, double y)  
 ;; BLResult   blMatrix2DSetSkewing (BLMatrix2D *self, double x, double y)  
 ;; BLResult   blMatrix2DSetRotation (BLMatrix2D *self, double angle, double cx, double cy)  
 ;; BLResult   blMatrix2DApplyOp (BLMatrix2D *self, uint32_t opType, const void *opData)  
 ;; BLResult   blMatrix2DInvert (BLMatrix2D *dst, const BLMatrix2D *src)  
 ;; uint32_t   blMatrix2DGetType (const BLMatrix2D *self)  
 ;; BLResult   blMatrix2DMapPointDArray (const BLMatrix2D *self, BLPoint *dst, const BLPoint *src, size_t count)  
