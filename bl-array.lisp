;;;; bl-array.lisp 

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

;; BLArray  
;; BLResult   blArrayInit (BLArrayCore *self, uint32_t arrayTypeId)  
;;  BLResult   blArrayReset (BLArrayCore *self)  
;;  size_t   blArrayGetSize (const BLArrayCore *self)  
;;  size_t   blArrayGetCapacity (const BLArrayCore *self)  
;;  const void *   blArrayGetData (const BLArrayCore *self)  
;;  BLResult   blArrayClear (BLArrayCore *self)  
;;  BLResult   blArrayShrink (BLArrayCore *self)  
;;  BLResult   blArrayReserve (BLArrayCore *self, size_t n)  
;;  BLResult   blArrayResize (BLArrayCore *self, size_t n, const void *fill)  
;;  BLResult   blArrayMakeMutable (BLArrayCore *self, void **dataOut)  
;;  BLResult   blArrayModifyOp (BLArrayCore *self, uint32_t op, size_t n, void **dataOut)  
;;  BLResult   blArrayInsertOp (BLArrayCore *self, size_t index, size_t n, void **dataOut)  
;;  BLResult   blArrayAssignMove (BLArrayCore *self, BLArrayCore *other)  
;;  BLResult   blArrayAssignWeak (BLArrayCore *self, const BLArrayCore *other)  
;;  BLResult   blArrayAssignDeep (BLArrayCore *self, const BLArrayCore *other)  
;;  BLResult   blArrayAssignView (BLArrayCore *self, const void *items, size_t n)  
;;  BLResult   blArrayAppendU8 (BLArrayCore *self, uint8_t value)  
;;  BLResult   blArrayAppendU16 (BLArrayCore *self, uint16_t value)  
;;  BLResult   blArrayAppendU32 (BLArrayCore *self, uint32_t value)  
;;  BLResult   blArrayAppendU64 (BLArrayCore *self, uint64_t value)  
;;  BLResult   blArrayAppendF32 (BLArrayCore *self, float value)  
;;  BLResult   blArrayAppendF64 (BLArrayCore *self, double value)  
;;  BLResult   blArrayAppendItem (BLArrayCore *self, const void *item)  
;;  BLResult   blArrayAppendView (BLArrayCore *self, const void *items, size_t n)  
;;  BLResult   blArrayInsertU8 (BLArrayCore *self, size_t index, uint8_t value)  
;;  BLResult   blArrayInsertU16 (BLArrayCore *self, size_t index, uint16_t value)  
;;  BLResult   blArrayInsertU32 (BLArrayCore *self, size_t index, uint32_t value)  
;;  BLResult   blArrayInsertU64 (BLArrayCore *self, size_t index, uint64_t value)  
;;  BLResult   blArrayInsertF32 (BLArrayCore *self, size_t index, float value)  
;;  BLResult   blArrayInsertF64 (BLArrayCore *self, size_t index, double value)  
;;  BLResult   blArrayInsertItem (BLArrayCore *self, size_t index, const void *item)  
;;  BLResult   blArrayInsertView (BLArrayCore *self, size_t index, const void *items, size_t n)  
;;  BLResult   blArrayReplaceU8 (BLArrayCore *self, size_t index, uint8_t value)  
;;  BLResult   blArrayReplaceU16 (BLArrayCore *self, size_t index, uint16_t value)  
;;  BLResult   blArrayReplaceU32 (BLArrayCore *self, size_t index, uint32_t value)  
;;  BLResult   blArrayReplaceU64 (BLArrayCore *self, size_t index, uint64_t value)  
;;  BLResult   blArrayReplaceF32 (BLArrayCore *self, size_t index, float value)  
;;  BLResult   blArrayReplaceF64 (BLArrayCore *self, size_t index, double value)  
;;  BLResult   blArrayReplaceItem (BLArrayCore *self, size_t index, const void *item)  
;;  BLResult   blArrayReplaceView (BLArrayCore *self, const BLRange *range, const void *items, size_t n)
;;  BLResult   blArrayRemoveIndex (BLArrayCore *self, size_t index)  
;;  BLResult   blArrayRemoveRange (BLArrayCore *self, const BLRange *range)  
;;  bool   blArrayEquals (const BLArrayCore *a, const BLArrayCore *b)  

