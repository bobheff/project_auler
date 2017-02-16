(define (digits n)
  (if (zero? n)
    '()
    (cons (remainder n 10) (digits (quotient n 10)) )))
(reduce-right + 0 (digits (expt 2 1000)))

