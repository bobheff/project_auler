;(declare (usual-integrations))

; compute the sum of a list
(define (sum l)
  (if (eqv? l '())
   0 
    (+ (car l) (sum (cdr l)))))

; extract unique elements from a list
(define (unique l)
  (if (eqv? l '())
    l
    (if (member (car l) (cdr l))
      (unique (cdr l))
      (cons (car l) (unique (cdr l))))))

; get list of all multiples of a < n
(define (mult a n)
  (define (mult-iter x)
    (if (>= (* a x) n)
      '()
      (cons (* a x) (mult-iter (+ x 1)))))
  (mult-iter 1))

; Note: this is very slow!
(display (sum (unique (append (mult 5 1000) (mult 3 1000)))))
