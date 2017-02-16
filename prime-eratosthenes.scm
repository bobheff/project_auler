; TODO: rewrite using vectors
; (this should be more space efficient & perhaps faster)
; Also: maybe do up some fancier sieves

(define (two-up-to n) (iota (- n 1) 2 1))
(define (multiple? a b) (and (>= a b) (= (modulo a b) 0)))

(define (mark n) (list n #t))
(define (unmarked? n) (not (pair? n)))
(define (mark-multiples n num-list)
  (define (mark-multiples-iter l)
    (if (null? l)
      l
      (if (multiple? (car l) n)
        (cons (mark (car l)) (mark-multiples-iter (cdr l)))
        (cons (car l) (mark-multiples-iter (cdr l))))))
  (mark-multiples-iter num-list))

(define (eratosthenes-list num-list)
  (if (null? num-list)
      num-list
      (if (unmarked? (car num-list))
        (cons (car num-list) (eratosthenes-list (filter unmarked? (mark-multiples (car num-list) (cdr num-list)))))
        (cons (car num-list) (eratosthenes-list (cdr num-list))))))
(define (eratosthenes n) (eratosthenes-list (two-up-to n)))
