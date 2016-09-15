#lang racket

; 1. List-length

(define (list-length xs)
  (if (empty? xs)
    0
    (+ 1 (list-length (rest xs)))
  )
)

(list-length '(1 2 3)) ; -> 3

; 2. count-evens

(define (count-evens xs)
  (if (empty? xs)
    0
    (if (even? (first xs))
      (+ 1 (count-evens (rest xs)))
      (count-evens (rest xs))
    )
  )
)

; addendum; could have just filtered evens then called list-length

(count-evens '(1 2 3)) ; -> 1
(count-evens '(2 4 8)) ; -> 3

; 3. list-square

(define (square x)
  (* x x)
)

(define (list-square xs)
  (map square xs)
)

(list-square '(1 2 3)) ; -> '(1 4 9)

; 4. list-add1

(define (add1 x)
  (+ x 1)
)

(define (list-add1 lst)
  (map add1 lst)
)

(list-add1 '(1 2 3)) ; -> '(2 3 4)

; 5. list-add10

(define (add10 x)
  (+ x 10)
)

(define (list-add10 lst)
  (map add10 lst)
)

(list-add10 '(1 2 3)) ; -> '(11 12 13)

; 6. list-addn

(define (addn x n)
  (+ x n)
)

(define (list-addn lst n)
  (map (lambda (x)
    (addn x n)
  ) lst)
)

(list-addn '(1 2 3) 1) ; -> '(2 3 4)
(list-addn '(1 2 3) 2) ; -> '(3 4 5)

; 7. filter-even

(define (filter-even lst)
  (filter even? lst)
)

(filter-even '(1 2 3 4)) ; -> '(2 4)

; 8. filter-positive

(define (filter-positive lst)
  (filter (lambda (elem) (<= 0 elem)) lst)
)

(filter-positive '(-1 0 1)) ; -> '(1)
(filter-positive '(-100)) ; -> '()
(filter-positive '(100)) ; -> '(100)

; 9. filter-gt
;
(define (filter-gt lst lower)
  (filter (lambda (elem) (<= lower elem)) lst)
)

(filter-gt '(1 2 3 4 5) 3) ; -> '(3 4 5)
