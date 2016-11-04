#lang racket

(provide (all-defined-out))

(define x 3) ; val x = 3
(define y (+ x 2)) ; + is a function, call it here

(define cube1
  (lambda (x)
    (* x (* x x)))) ; x * (x * x)

(define cube2
  (lambda (x)
    (* x x x))) ; This is better

(define (cube3 x)
  (* x x x))

(define (pow1 x y) ; x to the yth power
  (if (= y 0)
      1
      (* x (pow1 x (- y 1))))) 

(define pow2 ; Curried version
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define three-to-the (pow2 3))
; (three-to-the 4)

