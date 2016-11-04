#lang racket

(provide (all-defined-out))

; Empty list          : null
; Cons Constructor    : cons
; Access head of list : car
; Access tail of list : cdr
; Check for empty     : null?

; sum all the numbers in a list
(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))

(sum (list 1 2 3 4))

; append
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

; map
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs))
            (my-map f (cdr xs)))))