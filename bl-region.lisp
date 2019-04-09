;;;; bl-region.lisp

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

 ;; BLRegion  
 ;; BLResult   blRegionInit (BLRegionCore *self)  
 ;; BLResult   blRegionReset (BLRegionCore *self)  
 ;; BLResult   blRegionClear (BLRegionCore *self)  
 ;; BLResult   blRegionShrink (BLRegionCore *self)  
 ;; BLResult   blRegionReserve (BLRegionCore *self, size_t n)  
 ;; BLResult   blRegionAssignMove (BLRegionCore *self, BLRegionCore *other)  
 ;; BLResult   blRegionAssignWeak (BLRegionCore *self, const BLRegionCore *other)  
 ;; BLResult   blRegionAssignDeep (BLRegionCore *self, const BLRegionCore *other)  
 ;; BLResult   blRegionAssignBoxI (BLRegionCore *self, const BLBoxI *src)  
 ;; BLResult   blRegionAssignBoxIArray (BLRegionCore *self, const BLBoxI *data, size_t n)  
 ;; BLResult   blRegionAssignRectI (BLRegionCore *self, const BLRectI *rect)  
 ;; BLResult   blRegionAssignRectIArray (BLRegionCore *self, const BLRectI *data, size_t n)  
 ;; BLResult   blRegionCombine (BLRegionCore *self, const BLRegionCore *a, const BLRegionCore *b, uint32_t op)  
 ;; BLResult   blRegionCombineRB (BLRegionCore *self, const BLRegionCore *a, const BLBoxI *b, uint32_t op)  
 ;; BLResult   blRegionCombineBR (BLRegionCore *self, const BLBoxI *a, const BLRegionCore *b, uint32_t op)  
 ;; BLResult   blRegionCombineBB (BLRegionCore *self, const BLBoxI *a, const BLBoxI *b, uint32_t op)  
 ;; BLResult   blRegionTranslate (BLRegionCore *self, const BLRegionCore *r, const BLPointI *pt)  
 ;; BLResult   blRegionTranslateAndClip (BLRegionCore *self, const BLRegionCore *r, const BLPointI *pt, const BLBoxI *clipBox)  
 ;; BLResult   blRegionIntersectAndClip (BLRegionCore *self, const BLRegionCore *a, const BLRegionCore *b, const BLBoxI *clipBox)  
 ;; bool   blRegionEquals (const BLRegionCore *a, const BLRegionCore *b)  
 ;; uint32_t   blRegionGetType (const BLRegionCore *self)  
 ;; uint32_t   blRegionHitTest (const BLRegionCore *self, const BLPointI *pt)  
 ;; uint32_t   blRegionHitTestBoxI (const BLRegionCore *self, const BLBoxI *box)  
