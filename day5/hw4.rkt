#lang racket

;;; Student Name: Dakota Nelson
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from nobody
;;;     and/or using these external resources: racket onepager

; 1. Turn evaluator into REPL

(define (assq key lst)
  (if (or (null? lst) (null? (first lst)))
    #f
    (if (eq? key (first (first lst)))
      (first lst)
      (assq key (rest lst))
    )
  )
)

(define (calc-first x lookup-lst)
  (calculate (first (rest x)) lookup-lst)
)

(define (calc-rest x lookup-lst)
  (calculate (first (rest (rest x))) lookup-lst)
)

(define (calculate x lookup-lst)
  (if (or (number? x) (boolean? x))
    x
    (if (assq x lookup-lst)
      (first (rest (assq x lookup-lst)))
      (if (eq? (first x) 'ADD)
        (+ (calc-first x lookup-lst) (calc-rest x lookup-lst))
        (if (eq? (first x) 'SUB)
          (- (calc-first x lookup-lst) (calc-rest x lookup-lst))
          (if (eq? (first x) 'MUL)
            (* (calc-first x lookup-lst) (calc-rest x lookup-lst))
            (if (eq? (first x) 'GT)
              (> (calc-first x lookup-lst) (calc-rest x lookup-lst))
              (if (eq? (first x) 'LT)
                (< (calc-first x lookup-lst) (calc-rest x lookup-lst))
                (if (eq? (first x) 'GE)
                  (>= (calc-first x lookup-lst) (calc-rest x lookup-lst))
                  (if (eq? (first x) 'LE)
                    (<= (calc-first x lookup-lst) (calc-rest x lookup-lst))
                    (if (eq? (first x) 'EQ)
                      (= (calc-first x lookup-lst) (calc-rest x lookup-lst))
                      (if (eq? (first x) 'NE)
                        (not (= (calc-first x lookup-lst) (calc-rest x lookup-lst)))
                        (if (eq? (first x) 'ANND)
                          (and (calc-first x lookup-lst) (calc-rest x lookup-lst))
                          (if (eq? (first x) 'ORR)
                            (or (calc-first x lookup-lst) (calc-rest x lookup-lst))
                            (if (eq? (first x) 'NOTT)
                              (not (calc-first x lookup-lst) (calc-rest x lookup-lst))
                              (if (eq? (first x) 'IPH)
                                (if (calc-first x lookup-lst)
                                  (calc-rest x lookup-lst)
                                  (calculate (first (rest (rest (rest x)))) lookup-lst)
                                )
                                (display "broken")
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)


(define (run-repl)
  (display "Welcome to my REPL. Type something scheme-ish and hit <return>:")
  (newline)
  (repl)
)

(define (repl)
  (display "> ")
  (display (myeval (read)))
  (newline)
  (repl)
)

(define (myeval sexpr)
   (calculate sexpr null)
)

; actually kick off the REPL
(run-repl)
