#lang racket

(provide (all-defined-out))

(define (factorial-normal x)
  (if (= x 0)
      1
      (* x (factorial-normal (- x 1)))))

; Below is not working...because this evaluates both e2 and e3
(define (my-if-bad e1 e2 e3)
  (if e1 e2 e3))

(define (factorial-bad x)
  (my-if-bad (= x 0)
             1
             (* x (factorial-bad (- x 1)))))

; Below is strange but works
(define (my-strange-if-but-works e1 e2 e3)
  (if e1 (e2) (e3)))

(define (factorial-strange x)
  (my-strange-if-but-works (= x 0)
             (lambda () 1)
             (lambda () (* x (factorial-bad (- x 1))))))

;(define (f th)
;  if (...) 0 (... (th) ...))

; Silly addition function that purposely runs slows
(define (slow-add x y)
  (letrec ([slow-id (lambda (y z)
                      (if (= 0 z)
                          y
                          (slow-id y (- z 1))))])
    (+ (slow-id x 50000000 y))))

; multiplies x and result of y-thunk, calling y-thunk x times
(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))