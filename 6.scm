(define (up-to n) 
  (define (iter x) 
    (if (= x n) 
      (cons x ()) 
      (cons x (iter (+ x 1)))))
  (iter 1))

(define (square x) (* x x))

(define n 100)

(-
  (square (fold-right + 0 (up-to n)))
  (fold-right + 0 (map square (up-to n))))
