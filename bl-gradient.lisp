;;;; bl-gradient.lisp

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

 ;; BLGradient  
 ;; BLResult   blGradientInit (BLGradientCore *self)  
 ;; BLResult   blGradientInitAs (BLGradientCore *self, uint32_t type, const void *values, uint32_t extendMode, const BLGradientStop *stops,  
 ;;   size_t n, const BLMatrix2D *m)  
 ;; BLResult   blGradientReset (BLGradientCore *self)  
 ;; BLResult   blGradientAssignMove (BLGradientCore *self, BLGradientCore *other)  
 ;; BLResult   blGradientAssignWeak (BLGradientCore *self, const BLGradientCore *other)  
 ;; BLResult   blGradientCreate (BLGradientCore *self, uint32_t type, const void *values, uint32_t extendMode, const BLGradientStop *stops,  
 ;;   size_t n, const BLMatrix2D *m)  
 ;; BLResult   blGradientShrink (BLGradientCore *self)  
 ;; BLResult   blGradientReserve (BLGradientCore *self, size_t n)  
 ;; uint32_t   blGradientGetType (const BLGradientCore *self)  
 ;; BLResult   blGradientSetType (BLGradientCore *self, uint32_t type)  
 ;; double   blGradientGetValue (const BLGradientCore *self, size_t index)  
 ;; BLResult   blGradientSetValue (BLGradientCore *self, size_t index, double value)  
 ;; BLResult   blGradientSetValues (BLGradientCore *self, size_t index, const double *values, size_t n)  
 ;; uint32_t   blGradientGetExtendMode (BLGradientCore *self)  
 ;; BLResult   blGradientSetExtendMode (BLGradientCore *self, uint32_t extendMode)  
 ;; const BLGradientStop *   blGradientGetStops (const BLGradientCore *self)  
 ;; size_t   blGradientGetSize (const BLGradientCore *self)  
 ;; size_t   blGradientGetCapacity (const BLGradientCore *self)  
 ;; BLResult   blGradientResetStops (BLGradientCore *self)  
 ;; BLResult   blGradientAssignStops (BLGradientCore *self, const BLGradientStop *stops, size_t n)  
 ;; BLResult   blGradientAddStopRgba32 (BLGradientCore *self, double offset, uint32_t argb32)  
 ;; BLResult   blGradientAddStopRgba64 (BLGradientCore *self, double offset, uint64_t argb64)  
 ;; BLResult   blGradientRemoveStop (BLGradientCore *self, size_t index)  
 ;; BLResult   blGradientRemoveStopByOffset (BLGradientCore *self, double offset, uint32_t all)  
 ;; BLResult   blGradientRemoveStops (BLGradientCore *self, const BLRange *range)  
 ;; BLResult   blGradientRemoveStopsFromTo (BLGradientCore *self, double offsetMin, double offsetMax)  
 ;; BLResult   blGradientReplaceStopRgba32 (BLGradientCore *self, size_t index, double offset, uint32_t rgba32)  
 ;; BLResult   blGradientReplaceStopRgba64 (BLGradientCore *self, size_t index, double offset, uint64_t rgba64)  
 ;; size_t   blGradientIndexOfStop (const BLGradientCore *self, double offset)  
 ;; BLResult   blGradientApplyMatrixOp (BLGradientCore *self, uint32_t opType, const void *opData)  
 ;; bool   blGradientEquals (const BLGradientCore *a, const BLGradientCore *b)  

