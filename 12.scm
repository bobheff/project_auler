; Get list of prime factors of a number
(define (factor number)
  (define (*factor divisor number)
    (if (> (* divisor divisor) number)
        (list number)
        (if (= (modulo number divisor) 0)
            (cons divisor (*factor divisor (/ number divisor)))
            (*factor (+ divisor 1) number))))
  (*factor 2 number))

; Take list and return number of occurences of each element
(define (count-occurences lst)
  (let ((ht (make-hash-table)))
       (define (process key)
               (hash-table/modify! ht key 0 (lambda (x) (+ x 1))))
       (for-each process lst)
       (hash-table/datum-list ht)))

; If n = p_1^a_1 * ... * p_k^1_k
; then it has
; (a_1 + 1) * (a_2 + 1) * ... * (a_k + 1)
; divisors
(define (divisors n)
  (reduce-right * 1 (map (lambda (x) (+ x 1)) (count-occurences (factor n)))))

; Compute the answer
(define answer
  (let loop
   ((t 1)
    (n 2))
   (if (> (divisors t) 500)
     t
     (loop (+ t n) (+ n 1)))))

; display the answer
answer
