;;;; bl-file.lisp

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

 ;; BLFile  
 ;; BLResult   blFileInit (BLFileCore *self)  
 ;; BLResult   blFileReset (BLFileCore *self)  
 ;; BLResult   blFileOpen (BLFileCore *self, const char *fileName, uint32_t openFlags)  
 ;; BLResult   blFileClose (BLFileCore *self)  
 ;; BLResult   blFileSeek (BLFileCore *self, int64_t offset, uint32_t seekType, int64_t *positionOut)  
 ;; BLResult   blFileRead (BLFileCore *self, void *buffer, size_t n, size_t *bytesReadOut)  
 ;; BLResult   blFileWrite (BLFileCore *self, const void *buffer, size_t n, size_t *bytesWrittenOut)  
 ;; BLResult   blFileTruncate (BLFileCore *self, int64_t maxSize)  
 ;; BLResult   blFileGetSize (BLFileCore *self, uint64_t *fileSizeOut)  


