;;;; bl-font-data.lisp

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

 ;; BLFontData  
 ;; BLResult   blFontDataInit (BLFontDataCore *self)  
 ;; BLResult   blFontDataReset (BLFontDataCore *self)  
 ;; BLResult   blFontDataAssignMove (BLFontDataCore *self, BLFontDataCore *other)  
 ;; BLResult   blFontDataAssignWeak (BLFontDataCore *self, const BLFontDataCore *other)  
 ;; bool   blFontDataEquals (const BLFontDataCore *a, const BLFontDataCore *b)  
 ;; BLResult   blFontDataListTags (const BLFontDataCore *self, BLArrayCore *dst)  
 ;; size_t   blFontDataQueryTables (const BLFontDataCore *self, BLFontTable *dst, const BLTag *tags, size_t count)  
