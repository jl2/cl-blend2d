;;;; bl-string.lisp

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

 ;; BLString  
 ;; BLResult   blStringInit (BLStringCore *self)  
 ;; BLResult   blStringReset (BLStringCore *self)  
 ;; size_t   blStringGetSize (const BLStringCore *self)  
 ;; size_t   blStringGetCapacity (const BLStringCore *self)  
 ;; const char *   blStringGetData (const BLStringCore *self)  
 ;; BLResult   blStringClear (BLStringCore *self)  
 ;; BLResult   blStringShrink (BLStringCore *self)  
 ;; BLResult   blStringReserve (BLStringCore *self, size_t n)  
 ;; BLResult   blStringResize (BLStringCore *self, size_t n, char fill)  
 ;; BLResult   blStringMakeMutable (BLStringCore *self, char **dataOut)  
 ;; BLResult   blStringModifyOp (BLStringCore *self, uint32_t op, size_t n, char **dataOut)  
 ;; BLResult   blStringInsertOp (BLStringCore *self, size_t index, size_t n, char **dataOut)  
 ;; BLResult   blStringAssignMove (BLStringCore *self, BLStringCore *other)  
 ;; BLResult   blStringAssignWeak (BLStringCore *self, const BLStringCore *other)  
 ;; BLResult   blStringAssignDeep (BLStringCore *self, const BLStringCore *other)  
 ;; BLResult   blStringAssignData (BLStringCore *self, const char *str, size_t n)  
 ;; BLResult   blStringApplyOpChar (BLStringCore *self, uint32_t op, char c, size_t n)  
 ;; BLResult   blStringApplyOpData (BLStringCore *self, uint32_t op, const char *str, size_t n)  
 ;; BLResult   blStringApplyOpString (BLStringCore *self, uint32_t op, const BLStringCore *other)  
 ;; BLResult   blStringApplyOpFormat (BLStringCore *self, uint32_t op, const char *fmt,...)  
 ;; BLResult   blStringApplyOpFormatV (BLStringCore *self, uint32_t op, const char *fmt, va_list ap)  
 ;; BLResult   blStringInsertChar (BLStringCore *self, size_t index, char c, size_t n)  
 ;; BLResult   blStringInsertData (BLStringCore *self, size_t index, const char *str, size_t n)  
 ;; BLResult   blStringInsertString (BLStringCore *self, size_t index, const BLStringCore *other)  
 ;; BLResult   blStringRemoveRange (BLStringCore *self, const BLRange *range)  
 ;; bool   blStringEquals (const BLStringCore *self, const BLStringCore *other)  
 ;; bool   blStringEqualsData (const BLStringCore *self, const char *str, size_t n)  
 ;; int   blStringCompare (const BLStringCore *self, const BLStringCore *other)  
 ;; int   blStringCompareData (const BLStringCore *self, const char *str, size_t n)  
