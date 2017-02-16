(declare (usual-integrations))

(define (sum l) (fold-right + 0 l))

(load "prime-eratosthenes")
(sum (eratosthenes 2000000))
