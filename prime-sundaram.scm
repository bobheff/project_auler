; This is very inefficient at the moment

(define (ij-list n)
  (let loop ((i 1) (j 1) (num-list '()))
   (let ((num (+ i j (* 2 (* i j)))))
   (cond 
     ((and (= j n) (= i n))
      (if (< num n)
        (reverse (cons num num-list))
        (reverse num-list)))
     ((and (= j n) (< i n))
      (if (< num n)
        (loop (+ i 1) 1 (cons num num-list))
        (loop (+ i 1) 1 num-list)))
     (else
      (if (< num n)
        (loop i (+ j 1) (cons num num-list))
        (loop i (+ j 1) num-list)))))))
          
      
(define (set-difference s1 s2)
  (cond ((null? s1)
         '())
        ((not (member (car s1) s2))
         (cons (car s1) (set-difference (cdr s1) s2)))
        (else
         (set-difference (cdr s1) s2))))

(map (lambda (x) (+ (* 2 x) 1)) (set-difference (iota 10000 1 1) (ij-list 10000)))
