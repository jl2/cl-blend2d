;;;; bl-image.lisp

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

 ;; BLImage  
 ;; BLResult   blImageInit (BLImageCore *self)  
 ;; BLResult   blImageInitAs (BLImageCore *self, int w, int h, uint32_t format)  
 ;; BLResult   blImageReset (BLImageCore *self)  
 ;; BLResult   blImageAssignMove (BLImageCore *self, BLImageCore *other)  
 ;; BLResult   blImageAssignWeak (BLImageCore *self, const BLImageCore *other)  
 ;; BLResult   blImageAssignDeep (BLImageCore *self, const BLImageCore *other)  
 ;; BLResult   blImageCreate (BLImageCore *self, int w, int h, uint32_t format)  
 ;; BLResult   blImageCreateFromData (BLImageCore *self, int w, int h, uint32_t format, void *pixelData, intptr_t stride,  
 ;;   BLDestroyImplFunc destroyFunc, void *destroyData)  
 ;; BLResult   blImageGetData (const BLImageCore *self, BLImageData *dataOut)  
 ;; BLResult   blImageMakeMutable (BLImageCore *self, BLImageData *dataOut)  
 ;; bool   blImageEquals (const BLImageCore *a, const BLImageCore *b)  
 ;; BLResult   blImageScale (BLImageCore *dst, const BLImageCore *src, const BLSizeI *size, uint32_t filter, const  
 ;;   BLImageScaleOptions *options)  
 ;; BLResult   blImageReadFromFile (BLImageCore *self, const char *fileName, const BLArrayCore *codecs)  
 ;; BLResult   blImageReadFromData (BLImageCore *self, const void *data, size_t size, const BLArrayCore *codecs)  
 ;; BLResult   blImageWriteToFile (const BLImageCore *self, const char *fileName, const BLImageCodecCore *codec)  
 ;; BLResult   blImageWriteToData (const BLImageCore *self, BLArrayCore *dst, const BLImageCodecCore *codec)  
