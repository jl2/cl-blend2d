;;;; bl-pattern.lisp

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

 ;; BLPattern  
 ;; BLResult   blPatternInit (BLPatternCore *self)  
 ;; BLResult   blPatternInitAs (BLPatternCore *self, const BLImageCore *image, const BLRectI *area, uint32_t extendMode,  
 ;;   const BLMatrix2D *m)  
 ;; BLResult   blPatternReset (BLPatternCore *self)  
 ;; BLResult   blPatternAssignMove (BLPatternCore *self, BLPatternCore *other)  
 ;; BLResult   blPatternAssignWeak (BLPatternCore *self, const BLPatternCore *other)  
 ;; BLResult   blPatternAssignDeep (BLPatternCore *self, const BLPatternCore *other)  
 ;; BLResult   blPatternCreate (BLPatternCore *self, const BLImageCore *image, const BLRectI *area, uint32_t extendMode,  
 ;;   const BLMatrix2D *m)  
 ;; BLResult   blPatternSetImage (BLPatternCore *self, const BLImageCore *image, const BLRectI *area)  
 ;; BLResult   blPatternSetArea (BLPatternCore *self, const BLRectI *area)  
 ;; BLResult   blPatternSetExtendMode (BLPatternCore *self, uint32_t extendMode)  
 ;; BLResult   blPatternApplyMatrixOp (BLPatternCore *self, uint32_t opType, const void *opData)  
 ;; bool   blPatternEquals (const BLPatternCore *a, const BLPatternCore *b)  

