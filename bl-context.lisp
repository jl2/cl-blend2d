;;;; bl-context.lisp

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

;; BLContext  
;;  BLResult   blContextInit (BLContextCore *self)  
;;  BLResult   blContextInitAs (BLContextCore *self, BLImageCore *image, const BLContextCreateOptions *options)  
;;  BLResult   blContextReset (BLContextCore *self)  
;;  BLResult   blContextAssignMove (BLContextCore *self, BLContextCore *other)  
;;  BLResult   blContextAssignWeak (BLContextCore *self, const BLContextCore *other)  
;;  BLResult   blContextBegin (BLContextCore *self, BLImageCore *image, const BLContextCreateOptions *options)  
;;  BLResult   blContextEnd (BLContextCore *self)  
;;  BLResult   blContextFlush (BLContextCore *self, uint32_t flags)  
;;  BLResult   blContextSave (BLContextCore *self, BLContextCookie *cookie)  
;;  BLResult   blContextRestore (BLContextCore *self, const BLContextCookie *cookie)  
;;  BLResult   blContextUserToMeta (BLContextCore *self)  
;;  BLResult   blContextMatrixOp (BLContextCore *self, uint32_t opType, const void *opData)  
;;  BLResult   blContextSetHint (BLContextCore *self, uint32_t hintType, uint32_t value)  
;;  BLResult   blContextSetHints (BLContextCore *self, const BLContextHints *hints)  
;;  BLResult   blContextSetFlattenMode (BLContextCore *self, uint32_t mode)  
;;  BLResult   blContextSetFlattenTolerance (BLContextCore *self, double tolerance)  
;;  BLResult   blContextSetApproximationOptions (BLContextCore *self, const BLApproximationOptions *options)  
;;  BLResult   blContextSetCompOp (BLContextCore *self, uint32_t compOp)  
;;  BLResult   blContextSetGlobalAlpha (BLContextCore *self, double alpha)  
;;  BLResult   blContextSetFillRule (BLContextCore *self, uint32_t fillRule)  
;;  BLResult   blContextSetFillAlpha (BLContextCore *self, double alpha)  
;;  BLResult   blContextGetFillStyle (const BLContextCore *self, void *object)  
;;  BLResult   blContextGetFillStyleRgba32 (const BLContextCore *self, uint32_t *rgba32)  
;;  BLResult   blContextGetFillStyleRgba64 (const BLContextCore *self, uint64_t *rgba64)  
;;  BLResult   blContextSetFillStyle (BLContextCore *self, const void *object)  
;;  BLResult   blContextSetFillStyleRgba32 (BLContextCore *self, uint32_t rgba32)  
;;  BLResult   blContextSetFillStyleRgba64 (BLContextCore *self, uint64_t rgba64)  
;;  BLResult   blContextSetStrokeWidth (BLContextCore *self, double width)  
;;  BLResult   blContextSetStrokeMiterLimit (BLContextCore *self, double miterLimit)  
;;  BLResult   blContextSetStrokeCap (BLContextCore *self, uint32_t position, uint32_t strokeCap)  
;;  BLResult   blContextSetStrokeCaps (BLContextCore *self, uint32_t strokeCap)  
;;  BLResult   blContextSetStrokeJoin (BLContextCore *self, uint32_t strokeJoin)  
;;  BLResult   blContextSetStrokeDashOffset (BLContextCore *self, double dashOffset)  
;;  BLResult   blContextSetStrokeDashArray (BLContextCore *self, const BLArrayCore *dashArray)  
;;  BLResult   blContextSetStrokeTransformOrder (BLContextCore *self, uint32_t transformOrder)  
;;  BLResult   blContextSetStrokeOptions (BLContextCore *self, const BLStrokeOptionsCore *options)  
;;  BLResult   blContextSetStrokeAlpha (BLContextCore *self, double alpha)  
;;  BLResult   blContextGetStrokeStyle (const BLContextCore *self, void *object)  
;;  BLResult   blContextGetStrokeStyleRgba32 (const BLContextCore *self, uint32_t *rgba32)  
;;  BLResult   blContextGetStrokeStyleRgba64 (const BLContextCore *self, uint64_t *rgba64)  
;;  BLResult   blContextSetStrokeStyle (BLContextCore *self, const void *object)  
;;  BLResult   blContextSetStrokeStyleRgba32 (BLContextCore *self, uint32_t rgba32)  
;;  BLResult   blContextSetStrokeStyleRgba64 (BLContextCore *self, uint64_t rgba64)  
;;  BLResult   blContextClipToRectI (BLContextCore *self, const BLRectI *rect)  
;;  BLResult   blContextClipToRectD (BLContextCore *self, const BLRect *rect)  
;;  BLResult   blContextRestoreClipping (BLContextCore *self)  
;;  BLResult   blContextClearAll (BLContextCore *self)  
;;  BLResult   blContextClearRectI (BLContextCore *self, const BLRectI *rect)  
;;  BLResult   blContextClearRectD (BLContextCore *self, const BLRect *rect)  
;;  BLResult   blContextFillAll (BLContextCore *self)  
;;  BLResult   blContextFillRectI (BLContextCore *self, const BLRectI *rect)  
;;  BLResult   blContextFillRectD (BLContextCore *self, const BLRect *rect)  
;;  BLResult   blContextFillPathD (BLContextCore *self, const BLPathCore *path)  
;;  BLResult   blContextFillGeometry (BLContextCore *self, uint32_t geometryType, const void *geometryData)  
;;  BLResult   blContextFillTextI (BLContextCore *self, const BLPointI *pt, const BLFontCore *font, const void *text, size_t  
;;    size, uint32_t encoding)  
;;  BLResult   blContextFillTextD (BLContextCore *self, const BLPoint *pt, const BLFontCore *font, const void *text, size_t  
;;    size, uint32_t encoding)  
;;  BLResult   blContextFillGlyphRunI (BLContextCore *self, const BLPointI *pt, const BLFontCore *font, const BLGlyphRun  
;;    *glyphRun)  
;;  BLResult   blContextFillGlyphRunD (BLContextCore *self, const BLPoint *pt, const BLFontCore *font, const BLGlyphRun  
;;    *glyphRun)  
;;  BLResult   blContextStrokeRectI (BLContextCore *self, const BLRectI *rect)  
;;  BLResult   blContextStrokeRectD (BLContextCore *self, const BLRect *rect)  
;;  BLResult   blContextStrokePathD (BLContextCore *self, const BLPathCore *path)  
;;  BLResult   blContextStrokeGeometry (BLContextCore *self, uint32_t geometryType, const void *geometryData)  
;;  BLResult   blContextStrokeTextI (BLContextCore *self, const BLPointI *pt, const BLFontCore *font, const void *text, size_t  
;;    size, uint32_t encoding)  
;;  BLResult   blContextStrokeTextD (BLContextCore *self, const BLPoint *pt, const BLFontCore *font, const void *text, size_t  
;;    size, uint32_t encoding)  
;;  BLResult   blContextStrokeGlyphRunI (BLContextCore *self, const BLPointI *pt, const BLFontCore *font, const  
;;    BLGlyphRun *glyphRun)  
;;  BLResult   blContextStrokeGlyphRunD (BLContextCore *self, const BLPoint *pt, const BLFontCore *font, const  
;;    BLGlyphRun *glyphRun)  
;;  BLResult   blContextBlitImageI (BLContextCore *self, const BLPointI *pt, const BLImageCore *img, const BLRectI  
;;    *imgArea)  
;;  BLResult   blContextBlitImageD (BLContextCore *self, const BLPoint *pt, const BLImageCore *img, const BLRectI  
;;    *imgArea)  
;;  BLResult   blContextBlitScaledImageI (BLContextCore *self, const BLRectI *rect, const BLImageCore *img, const BLRectI  
;;    *imgArea)  
;;  BLResult   blContextBlitScaledImageD (BLContextCore *self, const BLRect *rect, const BLImageCore *img, const BLRectI  
;;    *imgArea)  
