#lang racket

(provide (all-defined-out))

; Mutation
;(set! x e)

; Any code using this x will be affected
; Like x = e in Java, C, Python, etc...

; Once you have side-effects, sequences are useful

(define b 3)
(define f (lambda x) (* 1 (+ x + b)))
(define x (+ b 4)) ; 7
(set! b 5)
(define z (f 4)) ; 9
(define w c)     ; 7