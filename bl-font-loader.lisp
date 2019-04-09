;;;; bl-font-loader.lisp

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

 ;; BLFontLoader  
 ;; BLResult   blFontLoaderInit (BLFontLoaderCore *self)  
 ;; BLResult   blFontLoaderReset (BLFontLoaderCore *self)  
 ;; BLResult   blFontLoaderAssignMove (BLFontLoaderCore *self, BLFontLoaderCore *other)  
 ;; BLResult   blFontLoaderAssignWeak (BLFontLoaderCore *self, const BLFontLoaderCore *other)  
 ;; bool   blFontLoaderEquals (const BLFontLoaderCore *a, const BLFontLoaderCore *b)  
 ;; BLResult   blFontLoaderCreateFromFile (BLFontLoaderCore *self, const char *fileName)  
 ;; BLResult   blFontLoaderCreateFromDataArray (BLFontLoaderCore *self, const BLArrayCore *dataArray)  
 ;; BLResult   blFontLoaderCreateFromData (BLFontLoaderCore *self, const void *data, size_t size, BLDestroyImplFunc destroyFunc, void  
 ;;   *destroyData)  
 ;; BLFontDataImpl *   blFontLoaderDataByFaceIndex (BLFontLoaderCore *self, uint32_t faceIndex)  
