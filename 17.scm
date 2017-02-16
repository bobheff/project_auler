(define (add-to-all x lst)
  (if (null? lst)
    '()
    (cons (+ x (car lst)) (add-to-all x (cdr lst)))))

; one, two, three,...,nine
(define digits '(3 3 5 4 4 3 5 5 4))
; ten, eleven, ..., nineteen
(define tens '(3 6 6 8 8 7 7 9 8 8))
; twenty
(define twenty '(6))
; twenty-one, ..., twenty-nine
(define twenties (add-to-all (car twenty) digits))
(define thirty '(6))
(define thirties (add-to-all (car thirty) digits))
(define forty '(5))
(define forties (add-to-all (car forty) digits))
(define fifty '(5))
(define fifties (add-to-all (car fifty) digits))
(define sixty '(5))
(define sixties (add-to-all (car sixty) digits))
(define seventy '(7))
(define seventies (add-to-all (car seventy) digits))
(define eighty '(6))
(define eighties (add-to-all (car eighty) digits))
(define ninety '(6))
(define nineties (add-to-all (car ninety) digits))
(define sub-100 (append digits tens twenty twenties thirty thirties
                        forty forties fifty fifties sixty sixties
                        seventy seventies eighty eighties
                        ninety nineties))
(define hundred '(7))
(define hundreds (add-to-all (car hundred) digits))
(define hundred-and '(10))
(define (hundred-ands)
  (define (hundreds-iter lst)
    (if (null? lst)
      '()
      (append (add-to-all (car lst) (add-to-all (car hundred-and) sub-100)) (hundreds-iter (cdr lst)))))
  (hundreds-iter digits))
(define one-thousand '(11))
(define all (append sub-100 hundreds (hundred-ands) one-thousand))

(reduce-right + 0 all)
