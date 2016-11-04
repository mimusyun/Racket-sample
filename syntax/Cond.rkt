#lang racket

(provide (all-defined-out))

; Cond : avoid nested-if expressions when you can use cond-expressions

; Syntax (cond [e1a e1b]
;              [e2a e2b]
;              ...
;              [eNa eNb])
; eNa is usually #t

(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs) (+ (car xs) (sum3 (cdr xs))))]
        [#t (+ (sum3 (car xs) (sum3 (cdr xs))))]))

(define (sum4 xs)
  (cons [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum4 (cdr xs)))]
        [(list? xs) (+ (sum4 (car xs)) (sum4 (cdr xs)))]
        [#t (sum4 (cdr xs))]))

(define (count-falses xs)
  (cond [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))]
        [#t (+ 1 (count-falses (cdr xs)))]))

        
  