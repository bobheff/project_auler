(declare (usual-integrations))

(define (divides? a b)
    (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
                ((divides? test-divisor n) test-divisor)
                (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2)) 

(define (prime? n)
    (= n (smallest-divisor n)))

(define (factors n)
  (if (= 1 n)
    ()
    (let ((d (smallest-divisor n)))
      (cons d (factors (/ n d))))))

(define (largest-prime-factor n)
  (car (reverse (factors n))))

(largest-prime-factor 600851475143)
