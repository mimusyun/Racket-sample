#lang racket

(provide (all-defined-out))

; Pair
(define pr (cons 1 (cons #t "hi")))

; List : ends with null
(define lst (cons 1 (cons #t (cons "hi" null))))

(pair? pr)   ; => #t
(pair? lst)  ; => #f

(list? list) ; => #t
(list? pr)   ; => #f