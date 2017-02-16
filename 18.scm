(define triangle
  '#(#(3)
     #(7 4)
     #(2 4 6)
     #(8 5 9 3)))
(define num-rows (vector-length triangle))
(define (row i) (vector-ref triangle i))
(define (num-cols-row i) (vector-length (row i)))
(define (el i j) (vector-ref (row i) j))

(define (sum-path path) (reduce-right + 0 path))

;bored...
;try again later
