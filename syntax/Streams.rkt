#lang racket

(provide (all-defined-out))

; Streams : infinite sequence of values

; 1 1 1 1 1 ...
(define ones (lambda () (cons 1 ones)))

; 1 2 3 4 5 ...
(define (f x) (cons x (lambda () (f (+ x 1)))))
(define nats (lambda () (f 1)))

(define nats_better
  (letrec ([f (lambda (x) (cons x (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

; 2 4 8 16 ...
(define powers-of-two
  (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
    (lambda () (f 1))))
