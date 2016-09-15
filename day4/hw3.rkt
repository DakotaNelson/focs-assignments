#lang racket

;;; Student Name: Dakota Nelson
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment using these external resources: racket onepager

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define (assq key lst)
  (if (null? (first lst))
    #f
    (if (eq? key (first (first lst)))
      (first lst)
      (assq key (rest lst))
    )
  )

)

(assq 'Z '((X 1) (Y 2) (Z 3)))
(assq 'Y '((X 1) (Y 2) (Z 3)))

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.


(define (calculate x lookup-lst)
  (if (number? x)
    x
    (if (assq x lookup-lst)
      (first (rest (assq x lookup-lst)))
      (if (eq? (first x) 'ADD)
        (+ (calculate (first (rest x))) (calculate (first (rest (rest x)))))
        (if (eq? (first x) 'SUB)
          (- (calculate (first (rest x))) (calculate (first (rest (rest x)))))
          (if (eq? (first x) 'MUL)
            (* (calculate (first (rest x))) (calculate (first (rest (rest x)))))
            (if (eq? (first x) 'GT)
              (> (calculate (first (rest x))) (calculate (first (rest (rest x)))))
              (if (eq? (first x) 'LT)
                (< (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                (if (eq? (first x) 'GE)
                  (>= (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                  (if (eq? (first x) 'LE)
                    (<= (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                    (if (eq? (first x) 'EQ)
                      (= (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                      (if (eq? (first x) 'NE)
                        (not (= (calculate (first (rest x))) (calculate (first (rest (rest x))))))
                        (if (eq? (first x) 'ANND)
                          (and (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                          (if (eq? (first x) 'OR)
                            (or (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                            (if (eq? (first x) 'NOTT)
                              (not (calculate (first (rest x))) (calculate (first (rest (rest x)))))
                              (if (eq? (first x) 'IPH)
                                (if (calculate (first (rest x)))
                                  (calculate (first (rest (rest x))))
                                  (calculate (first (rest (rest (rest x)))))
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

(calculate 'FOO '((FOO 1) (BAR 2)))
