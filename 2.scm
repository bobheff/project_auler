(declare (usual-integrations))

; Fibonacci number not exceeding n
(define (fib-list n)
  (define (fib-iter l)
    (let ((next (+ (car l) (cadr l))))
     (if (> next n)
       l
       (fib-iter (cons next l)))))
  (fib-iter '(1 1)))

; sum of a list
(define (sum l)
  (if
    (null? l)
      0
      (+ (car l) (sum (cdr l)))))

(sum (filter even? (fib-list 4000000)))
