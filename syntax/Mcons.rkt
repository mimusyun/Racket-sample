#lang racket

(provide (all-defined-out))

; cons cells are immutable
; In Racket, you cannot mutate the contents of cons cells

(define x (cons 14 null))
(define y x)

(set! x (cons 42 null)) ; does not change y

(define mpr (mcons 1 (mcons #t "hi")))
(set-mcdr! mpr 47) ; (mcons 1 47)
(set-mcar! mpr 100) ; (mcons 100 47)

