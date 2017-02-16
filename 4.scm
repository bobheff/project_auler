(declare (usual-integrations))
(use srfi-1)

(define (palindrome? n)
  (define (digits n)
    (if (zero? n)
      '()
      (cons (remainder n 10) (digits (quotient n 10)) )))
  (define (palindrome-iter l)
    (cond ((= (length l) 1) #t)
          ((= (length l) 2) (= (car l) (cadr l)))
          (else
            (and (= (car l) (car (reverse l))) (palindrome-iter (reverse (cdr (reverse (cdr l)))))))))
  (palindrome-iter (digits n)))

(define (n-digit-numbers n)
  (iota (* 9 (expt 10 (- n 1))) (expt 10 (- n 1)) 1))

(define (make-tree l)
  (define (make-pairs x l)
    (filter (lambda (y) (>= (car y) (cadr y)))
      (map (lambda (z) (list x z)) l)))
  (map (lambda (y) (make-pairs y l)) l))
;  (map (lambda (y) (cons y (make-pairs y l))) l))

(define (leaf? tree) (and (number? (car tree)) (number? (cadr tree))))

(define (do-mult tree)
  (map (lambda (sub-tree)
         (if (leaf? sub-tree)
             (* (car sub-tree) (cadr sub-tree))
             (do-mult sub-tree)))
       tree))
     
(define (flatten x)
  (cond ((null? x) '())
    ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
    (else (list x))))

(define (max-list l)
  (cond
    ((null? l)       
      #f)
    ((null? (cdr l))
      (car l))
    ((< (car l) (cadr l))
      (max-list (cdr l)))
    (else 
      (max-list (cons (car l) (cddr l))))))
    
(print (max-list (filter palindrome? (flatten (do-mult (make-tree (n-digit-numbers 3)))))))

