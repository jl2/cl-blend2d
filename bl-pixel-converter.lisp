;;;; bl-pixel-converter.lisp

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

 ;; BLPixelConverter  
 ;; BLResult   blPixelConverterInit (BLPixelConverterCore *self)  
 ;; BLResult   blPixelConverterInitWeak (BLPixelConverterCore *self, const BLPixelConverterCore *other)  
 ;; BLResult   blPixelConverterReset (BLPixelConverterCore *self)  
 ;; BLResult   blPixelConverterAssign (BLPixelConverterCore *self, const BLPixelConverterCore *other)  
 ;; BLResult   blPixelConverterCreate (BLPixelConverterCore *self, const BLFormatInfo *dstInfo, const BLFormatInfo *srcInfo)  
 ;; BLResult   blPixelConverterConvert (const BLPixelConverterCore *self, void *dstData, intptr_t dstStride, const void  
 ;;   *srcData, intptr_t srcStride, uint32_t w, uint32_t h, const BLPixelConverterOptions *options)  
