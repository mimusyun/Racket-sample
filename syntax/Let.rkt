#lang racket

(provide (all-defined-out))

; local bindings
;
; - let : can bind any number of local variables
(define (silly-double x)
  (let ([x (+ x 3)]
        [y (+ x 2)])
    (+ x y -5)))

; - let* : same behavior in ML
(define (silly-double2 x)
  (let* ([x (+ x 3)]
         [y (+ x 2)])
    (+ x y -8)))

; - letrec : evaluated in the environment includes all the bindings
(define (silly-triple x)
  (letrec ([y (+ x 2)]
           [f (lambda(z) (+ z y w x))]
           [w (+ x 7)])
    (f -9)))

(define (silly-mod x)
  (letrec
      ([even? (lambda(x) (if (zero? x) #t (odd? (- x 1))))]
       [odd? (lambda(x) (if (zero? x) #f (even? (- x 1))))])
    (if (even? x) 0 1)))

; - define

(define (max-of-list xs)
  (cond [(null? xs) (error "max-of-list given empty list")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))