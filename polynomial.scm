(use-modules (srfi srfi-1))

(define (one-polynomial k fun . l)
  (letrec 
    ((d (if (null? l) 0 (car l)))
     (k-1 (- k 1))
     (vec (make-list k)) 
     (mod-k (lambda (x) (modulo x k)))
     (cf (lambda (j)
       (mod-k (reduce + 0
         (map (lambda (i)
           (* (expt i (- k-1 j)) (list-ref fun (modulo (- i d) k))))
             (iota k)))))))
    (begin 
      (list-set! vec 0 (list-ref fun (mod-k (- d))))
      (for-each (lambda (j) (list-set! vec j (cf j))) (iota k-1 1 1))
      (list-set! vec k-1 (mod-k (- (reduce + 0 fun))))
      vec)))

(define (cartesian-product lists)
  (fold-right (lambda (xs ys)
                (append-map (lambda (x)
                              (map (lambda (y)
                                     (cons x y))
                                   ys))
                            xs))
              '(())
              lists))

(define (replicate n k)
  (if (> n 0) (cons k (replicate (- n 1) k)) '()))

(define (all f l)
  (fold-right and #t (map f l)))

(define (any f l)
  (fold-right or #f (map f l)))

(define (all-lists n k)
  (cartesian-product (replicate n (iota k))))

(define (le xs ys)
  (all (lambda (x) (>= x 0)) (map - ys xs)))

(define n 1)
(define k 5)
(define k-1 (- k 1))
(define (mod-k x) (modulo x k))

(define (cf alpha delta fun)
  (* (mod-k (expt -1 (length (filter (lambda (x) (not (= x 0))) alpha))))
     ;(filter (lambda (x) (le x alpha)) (all-lists n k))
     ))
