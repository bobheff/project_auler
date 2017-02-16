(define (collatz n)
  (define (collatz-iter lst)
    (cond ((= (car lst) 1) lst)
          ((even? (car lst)) (collatz-iter (cons (/ (car lst) 2) lst)))
          (else (collatz-iter (cons (+ (* 3 (car lst)) 1) lst)))))
    (reverse (collatz-iter (cons n '()))))

(define answer
  (let loop
    ((n 1)
     (max-num 0)
     (max-length 0))
    (let ((c-len (length (collatz n))))
      (cond ((>= n 1000000) max-num)
            ((> c-len max-length) (loop (+ n 1) n c-len))
            (else (loop (+ n 1) max-num max-length))))))
answer

; To speed this up: keep a hash-table with numbers already seen
