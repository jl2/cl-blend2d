;;;; blend2d.lisp 
;;
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

(in-package :blend2d)

(cffi:define-foreign-library blend2d-lib
    (:darwin (:or "libblend2d.dylib" "libblend2d"))
    (:unix (:or "libblend2d.so" "libblend2d"))
    (t (:default "libblend2d")))
(cffi:use-foreign-library blend2d-lib)

(autowrap:c-include "/usr/local/include/blend2d.h"
                    :sysincludes (list #+linux"/usr/include/x86_64-linux-gnu/"
                                       #+linux"/usr/include/x86_64-linux-gnu/c++/7/"
                                       #+darwin"/Application/Xcode.app/Contents/Developer/Contents/MaxOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include")
                    :language "c"
                    :spec-path '(blend2d)
                    :symbol-regex (("^BL_(.*)" () "\\1")
                                   ("^BL(.*)" () "\\1")
                                   ("^bl(.*)" () "\\1"))
                    
                    :exclude-definitions ("^va_list$" "Random" "Signal" "abort" "abs")
                    :symbol-exceptions (("random" . "bl-random")
                                        ("signal" . "bl-signal")
                                        ("abort" . "bl-abort")
                                        ("abs" . "bl-abs")))
