
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

; P1
(define (sequence low high stride)
  (if (> low high)
  null
  (cons low (sequence (+ low stride) high stride))))

; P2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

; P3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

; P4
(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

; P5
(define funny-number-stream
  (letrec ([f (lambda (x) (if (= 0 (remainder x 5))
                              (cons (- 0 x) (lambda () (f (+ 1 x))))
                              (cons x (lambda () (f (+ 1 x))))))])
    (lambda () (f 1))))

; P6
(define dan-then-dog
  (letrec ([f (lambda (x) (if (= 0 (remainder x 2))
                              (cons "dog.jpg" (lambda () (f (+ 1 x))))
                              (cons "dan.jpg" (lambda () (f (+ 1 x))))))])
    (lambda () (f 1))))

; P7
(define (stream-add-zero s)
  (letrec ([f (lambda (s)
                (cons (cons 0 (car (s))) (lambda () (f (cdr (s))))))])
    (lambda () (f s))))

; P8
(define (cycle-lists xs ys)
  (letrec ([f (lambda (x y)
                (cond [(and (null? x) (null? y)) (cons (cons (car xs) (car ys)) (lambda () (f (cdr xs) (cdr ys))))]
                      [(null? x) (cons (cons (car xs) (car y)) (lambda () (f (cdr xs) (cdr y))))]
                      [(null? y) (cons (cons (car x) (car ys)) (lambda () (f (cdr x) (cdr ys))))]
                      [#t (cons (cons (car x) (car y)) (lambda () (f (cdr x) (cdr y))))]))])
    (lambda () (f xs ys))))

; P9
(define (vector-assoc v vec)
  (cond
    [(= 0 (vector-length vec)) #f]
    [(and (pair? (vector-ref vec 0)) (equal? v (car (vector-ref vec 0)))) (vector-ref vec 0)]
    [#t (vector-assoc v (vector-drop vec 1))]))

; P10
(define (cached-assoc xs n)
  (letrec ([pos 0]
           [memo (make-vector n #f)]  
           [f (lambda (x)
               (let ([ans (vector-assoc x memo)])
                 (if ans
                     ans
                     (let ([new-ans (assoc x xs)])
                       (if new-ans
                           (begin
                             (vector-set! memo pos new-ans)
                             (set! pos (if (= (- n 1) pos) 0 (+ pos 1)))
                             new-ans)
                           #f)
                           ))))])
    f))
        



