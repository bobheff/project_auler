(declare (usual-integrations))

(define (sum-to-1000? triple) (= 1000 (+ (first triple) (second triple) (third triple))))

(define (pythagorean-triple? triple)
  (= (square (third triple)) (+ (square (first triple)) (square (second triple)))))
(define (good? triple) (and (sum-to-1000? triple) (pythagorean-triple? triple)))

; This is just a big loop, starting at (maxnum, maxnum, maxnum)
; and counting down to (1,1,1)
; It will stop when a good triple is found
; Not very "recursive" and not particularly clever
; But fast enough when compiled

(define (search maxnum)
  (let loop
   ((x maxnum)
    (y maxnum)
    (z maxnum))
   (cond ((good? (list x y z))
          (list x y z))
         ((and (= x 1) (= y 1) (= z 1))
          '())
         ((and (= z 1) (> y 1))
          (loop x (- y 1) maxnum))
         ((and (= z 1) (= y 1) (> x 1))
          (loop (- x 1) maxnum maxnum))
         (else
           (loop x y (- z 1))))))

(search 500)

