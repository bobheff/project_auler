(declare (usual-integrations))

; Load our definition of prime?
(load "prime-brute_force")
;(load "prime-probabilistic")

(define (nth-prime n)
  (do ((i 1 (+ i 2)) (count 0 (+ count (if (prime? i) 1 0))))
      ((= count (- n 1)) (- i 2))
      ()))

; Do it!
(nth-prime 10001)
