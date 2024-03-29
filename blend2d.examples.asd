;; blend2d.examples.asd
;; Copyright (c) 2023 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>

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

(in-package :cl-user)
(defpackage :blend2d.examples-asd
  (:use :cl :asdf))
(in-package :blend2d.examples-asd)

(asdf:defsystem #:blend2d.examples
  :description "Blend2D binding examples."
  :author "Jeremiah LaRocco <jeremiah_larocco@fastmail.com>"
  :license  "ISC"
  :version "0.0.1"
  :serial t
  :depends-on ( :blend2d
                :j-utils
                :alexandria)

  :components ((:module "examples"
                        :components
                        ((:file "package")
                         (:file "getting-started-1")
                         (:file "getting-started-2")
                         (:file "getting-started-3")
                         (:file "getting-started-4")
                         (:file "getting-started-5")
                         (:file "getting-started-6")
                         (:file "getting-started-7")
                         (:file "getting-started-8")
                         (:file "random-objects")))))
