;;;; bl-font-face.lisp

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

 ;; BLFontFace  
 ;; BLResult   blFontFaceInit (BLFontFaceCore *self)  
 ;; BLResult   blFontFaceReset (BLFontFaceCore *self)  
 ;; BLResult   blFontFaceAssignMove (BLFontFaceCore *self, BLFontFaceCore *other)  
 ;; BLResult   blFontFaceAssignWeak (BLFontFaceCore *self, const BLFontFaceCore *other)  
 ;; bool   blFontFaceEquals (const BLFontFaceCore *a, const BLFontFaceCore *b)  
 ;; BLResult   blFontFaceCreateFromFile (BLFontFaceCore *self, const char *fileName)  
 ;; BLResult   blFontFaceCreateFromLoader (BLFontFaceCore *self, const BLFontLoaderCore *loader, uint32_t faceIndex)  
