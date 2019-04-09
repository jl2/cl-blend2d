;;;; bl-path.lisp

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

 ;; BLPath  
 ;; BLResult   blPathInit (BLPathCore *self)  
 ;; BLResult   blPathReset (BLPathCore *self)  
 ;; size_t   blPathGetSize (const BLPathCore *self)  
 ;; size_t   blPathGetCapacity (const BLPathCore *self)  
 ;; const uint8_t *   blPathGetCommandData (const BLPathCore *self)  
 ;; const BLPoint *   blPathGetVertexdData (const BLPathCore *self)  
 ;; BLResult   blPathClear (BLPathCore *self)  
 ;; BLResult   blPathShrink (BLPathCore *self)  
 ;; BLResult   blPathReserve (BLPathCore *self, size_t n)  
 ;; BLResult   blPathModifyOp (BLPathCore *self, uint32_t op, size_t n, uint8_t **cmdDataOut, BLPoint **vtxDataOut)  
 ;; BLResult   blPathAssignMove (BLPathCore *self, BLPathCore *other)  
 ;; BLResult   blPathAssignWeak (BLPathCore *self, const BLPathCore *other)  
 ;; BLResult   blPathAssignDeep (BLPathCore *self, const BLPathCore *other)  
 ;; BLResult   blPathSetVertexAt (BLPathCore *self, size_t index, uint32_t cmd, double x, double y)  
 ;; BLResult   blPathMoveTo (BLPathCore *self, double x0, double y0)  
 ;; BLResult   blPathLineTo (BLPathCore *self, double x1, double y1)  
 ;; BLResult   blPathPolyTo (BLPathCore *self, const BLPoint *poly, size_t count)  
 ;; BLResult   blPathQuadTo (BLPathCore *self, double x1, double y1, double x2, double y2)  
 ;; BLResult   blPathCubicTo (BLPathCore *self, double x1, double y1, double x2, double y2, double x3, double y3)  
 ;; BLResult   blPathSmoothQuadTo (BLPathCore *self, double x2, double y2)  
 ;; BLResult   blPathSmoothCubicTo (BLPathCore *self, double x2, double y2, double x3, double y3)  
 ;; BLResult   blPathArcTo (BLPathCore *self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo)  
 ;; BLResult   blPathArcQuadrantTo (BLPathCore *self, double x1, double y1, double x2, double y2)  
 ;; BLResult   blPathEllipticArcTo (BLPathCore *self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double  
 ;;   y1)  
 ;; BLResult   blPathClose (BLPathCore *self)  
 ;; BLResult   blPathAddGeometry (BLPathCore *self, uint32_t geometryType, const void *geometryData, const BLMatrix2D *m, uint32_t dir)  
 ;; BLResult   blPathAddBoxI (BLPathCore *self, const BLBoxI *box, uint32_t dir)  
 ;; BLResult   blPathAddBoxD (BLPathCore *self, const BLBox *box, uint32_t dir)  
 ;; BLResult   blPathAddRectI (BLPathCore *self, const BLRectI *rect, uint32_t dir)  
 ;; BLResult   blPathAddRectD (BLPathCore *self, const BLRect *rect, uint32_t dir)  
 ;; BLResult   blPathAddPath (BLPathCore *self, const BLPathCore *other, const BLRange *range)  
 ;; BLResult   blPathAddTranslatedPath (BLPathCore *self, const BLPathCore *other, const BLRange *range, const BLPoint *p)  
 ;; BLResult   blPathAddTransformedPath (BLPathCore *self, const BLPathCore *other, const BLRange *range, const BLMatrix2D *m)  
 ;; BLResult   blPathAddReversedPath (BLPathCore *self, const BLPathCore *other, const BLRange *range, uint32_t reverseMode)  
 ;; BLResult   blPathAddStrokedPath (BLPathCore *self, const BLPathCore *other, const BLRange *range, const BLStrokeOptionsCore *options, const  
 ;;   BLApproximationOptions *approx)  
 ;; BLResult   blPathTranslate (BLPathCore *self, const BLRange *range, const BLPoint *p)  
 ;; BLResult   blPathTransform (BLPathCore *self, const BLRange *range, const BLMatrix2D *m)  
 ;; BLResult   blPathFitTo (BLPathCore *self, const BLRange *range, const BLRect *rect, uint32_t fitFlags)  
 ;; bool   blPathEquals (const BLPathCore *a, const BLPathCore *b)  
 ;; BLResult   blPathGetInfoFlags (const BLPathCore *self, uint32_t *flagsOut)  
 ;; BLResult   blPathGetControlBox (const BLPathCore *self, BLBox *boxOut)  
 ;; BLResult   blPathGetBoundingBox (const BLPathCore *self, BLBox *boxOut)  
 ;; BLResult   blPathGetFigureRange (const BLPathCore *self, size_t index, BLRange *rangeOut)  
 ;; BLResult   blPathGetLastVertex (const BLPathCore *self, BLPoint *vtxOut)  
 ;; BLResult   blPathGetClosestVertex (const BLPathCore *self, const BLPoint *p, double maxDistance, size_t *indexOut, double *distanceOut)  
 ;; uint32_t   blPathHitTest (const BLPathCore *self, const BLPoint *p, uint32_t fillRule)  
