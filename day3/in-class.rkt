#lang racket


;; 0. Factorial: both recursively and tail recursively
(define (rec-factorial n)
  (if (< n 2)
    1
    (* n (rec-factorial (- n 1)))
  )
)

(rec-factorial 1) ; -> 1
(rec-factorial 2) ; -> 2
(rec-factorial 3) ; -> 6
(rec-factorial 4) ; -> 24

(define (tail-factorial n)
 (iter-factorial 1 n)
)

(define (iter-factorial memo n)
  (if (< n 2)
    memo
    (iter-factorial (* memo n) (- n 1))
  )
)

(tail-factorial 1) ; -> 1
(tail-factorial 2) ; -> 2
(tail-factorial 3) ; -> 6
(tail-factorial 4) ; -> 24


;; 2. Reimplement filter

(define (my-filter test lst)
  ;(display lst)
  (if (null? lst)
    lst
    (if (test (first lst))
      (cons (first lst) (my-filter test (rest lst)))
      (my-filter test (rest lst))
    )
  )
)

(my-filter even? '(1 2 3 4 5 6)) ; -> '(2 4 6)


;; 3. Reimplement map

(define (my-map applicant lst)
  ;(display lst)
  (if (null? lst)
    lst
    (cons (applicant (first lst)) (my-map applicant (rest lst)))
  )
)

(define (double x) (* 2 x))
(my-map double '(1 2 3)) ; -> '(2 4 6)


;; 4. Reimplement append

(define (my-append acc b)
  (if (null? b)
    acc
    (my-append (cons acc (first b)) (rest b))
  )
)

(my-append '(1 2 3) '(4 5 6))
