(declare (usual-integrations))

(define (divisible? n x)
  (= (modulo n x) 0))

(define max-divisor 20)

(define lcm-divisors (fold-right lcm 1 (iota max-divisor 1 1)))

(define (num)
  (define (num-iter mult d)
    (let ((n (* mult lcm-divisors)))
      (cond ((> d max-divisor) n)
            ((not (divisible? n d)) (num-iter (+ mult 1) 1))
            (else (num-iter mult (+ d 1))))))
  (num-iter 1 1))

(num)
