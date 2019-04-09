;;;; bl-font.lisp

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

 ;; BLFont  
 ;; BLResult   blFontInit (BLFontCore *self)  
 ;; BLResult   blFontReset (BLFontCore *self)  
 ;; BLResult   blFontAssignMove (BLFontCore *self, BLFontCore *other)  
 ;; BLResult   blFontAssignWeak (BLFontCore *self, const BLFontCore *other)  
 ;; bool   blFontEquals (const BLFontCore *a, const BLFontCore *b)  
 ;; BLResult   blFontCreateFromFace (BLFontCore *self, const BLFontFaceCore *face, float size)  
 ;; BLResult   blFontShape (const BLFontCore *self, BLGlyphBufferCore *buf)  
 ;; BLResult   blFontMapTextToGlyphs (const BLFontCore *self, BLGlyphBufferCore *buf, BLGlyphMappingState *stateOut)  
 ;; BLResult   blFontPositionGlyphs (const BLFontCore *self, BLGlyphBufferCore *buf, uint32_t positioningFlags)  
 ;; BLResult   blFontApplyKerning (const BLFontCore *self, BLGlyphBufferCore *buf)  
 ;; BLResult   blFontApplyGSub (const BLFontCore *self, BLGlyphBufferCore *buf, size_t index, BLBitWord lookups)  
 ;; BLResult   blFontApplyGPos (const BLFontCore *self, BLGlyphBufferCore *buf, size_t index, BLBitWord lookups)  
 ;; BLResult   blFontGetTextMetrics (const BLFontCore *self, BLGlyphBufferCore *buf, BLTextMetrics *out)  
 ;; BLResult   blFontGetGlyphBounds (const BLFontCore *self, const void *glyphIdData, intptr_t glyphIdAdvance, BLBoxI *out, size_t count)  
 ;; BLResult   blFontGetGlyphAdvances (const BLFontCore *self, const void *glyphIdData, intptr_t glyphIdAdvance, BLGlyphPlacement *out, size_t count)  
 ;; BLResult   blFontGetGlyphOutlines (const BLFontCore *self, uint32_t glyphId, const BLMatrix2D *userMatrix, BLPathCore *out, BLPathSinkFunc sink, void *closure)  
 ;; BLResult   blFontGetGlyphRunOutlines (const BLFontCore *self, const BLGlyphRun *glyphRun, const BLMatrix2D *userMatrix, BLPathCore *out, BLPathSinkFunc sink, void *closure)
