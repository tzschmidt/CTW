#lang racket
(require plot)

(define output-file
  (if (vector-empty? (current-command-line-arguments))
      "../examples/A073_test.png"
      (first (vector->list (current-command-line-arguments)))))

(define input-file0
  (if (vector-empty? (current-command-line-arguments))
      "../examples/A073_k40_clingoDL_V1.txt"
      (second (vector->list (current-command-line-arguments)))))

(define input-file1
  (if (vector-empty? (current-command-line-arguments))
      "../examples/A073_k50_clingoDL_V1.txt"
      (third (vector->list (current-command-line-arguments)))))

(define input-file2
  (if (vector-empty? (current-command-line-arguments))
      #f
      (fourth (vector->list (current-command-line-arguments)))))

(define input-file3
  (if (vector-empty? (current-command-line-arguments))
      #f
      (fifth (vector->list (current-command-line-arguments)))))

(define input-files-list
  (let* ([file01 (if input-file1 (list input-file0 input-file1) (list input-file0))]
         [file012 (if input-file2 (append file01 (list input-file2)) file01)]
         [file0123 (if input-file3 (append file012 (list input-file3)) file012)])
    (if file0123 file0123 #f)))

(define (get-input-file x)
  (list-ref input-files-list x))

  
; get all the lines with optimization values from a file
(define (get-opt-values file)
  (filter (lambda (line) (regexp-match #rx"Optimization:" line))
          (sequence->list (in-lines file))))
  
(define (relevant-lines file)
  (call-with-input-file file get-opt-values))

(define (plot-values file)
  (for/list ([line (relevant-lines file)])
    (let* ([match (regexp-match #px"(\\d*):(\\d{2})\\.(\\d{1,3}) Optimization: ([\\d ]+)" line)]
           [time (+ (* (string->number (second match)) 60 1000)
                              (* (string->number (third match)) 1000)
                              (string->number (fourth match)))]
           [values (map string->number (string-split (fifth match)))]
           [opt-value (apply + values)])
      (list time opt-value))))

; We need to filter out values which have the same time stamp.
; Here we always use the latest one (see unit test below for an example).
(define (filter-duplicate-times values)
  (reverse (remove-duplicates (reverse values) #:key first)))

; embedded unit test for filter-duplicate-times
(module+ test
  (require rackunit)
  (check-equal? (filter-duplicate-times '((50 31) (50 12) (122 10) (122 6) (329 5) (329 3) (329 1)))
                '((50 12) (122 6) (329 1)) ))

(define (filtered-plot-values file)
  (filter-duplicate-times (plot-values file)))

(define (opt-values file)
  (map second (filtered-plot-values file)))

;(plot (discrete-histogram plot-values
;                          ;#:y-min (* (apply min opt-values) 0.9)
;                          #:y-max (* (apply max opt-values) 1.1)))

; For a more histogram like output we need to beautify by adding
; some values (for an example see the unit test)
(define (beautify-plot-values values)
  (if (< (length values) 2)
      values
      (foldl (lambda (x result)
               (append result
                       (list (list (first x) (second (last result)))) ; add an additional value which represents the from/to jump
                       (list x)))
             (list (first values)) ; initial value of the result
             (rest values))))

; embedded unit test for beautify-plot-vaues
(module+ test
  (check-equal? (beautify-plot-values '((50 12) (122 6) (329 1)))
                '((50 12) (122 12) (122 6) (329 6) (329 1)) )
  (check-equal? (beautify-plot-values '()) '())
  (check-equal? (beautify-plot-values '((1 2))) '((1 2))))

(define (lines-for-plot x)
  (let* ([file (get-input-file x)])
    (lines (beautify-plot-values (filtered-plot-values file))
           #:x-min (* 0.9 (first (first (filtered-plot-values file))))
           #:x-max (* 1.1 (first (last (filtered-plot-values file))))
           #:y-min (* (apply min (opt-values file)) 0.9)
           #:y-max (* (apply max (opt-values file)) 1.1))))

(define (plot-lines x title)
  (plot-file
   #:x-label "time in ms"
   #:y-label "optimization value"
   #:title title
   (case x
     [(0) (list (lines-for-plot 0))]
     [(1) (list (lines-for-plot 0) (lines-for-plot 1))]
     [(2) (list (lines-for-plot 0) (lines-for-plot 1) (lines-for-plot 2))]
     [(3) (list (lines-for-plot 0) (lines-for-plot 1) (lines-for-plot 2) (lines-for-plot 3))])
   output-file))

(define (plot-files)
  (case (length input-files-list)
    [(1) (plot-lines 0 (path->string (file-name-from-path (get-input-file 0))))]
    [(2) (plot-lines 1 (string-append (path->string (file-name-from-path (get-input-file 0)))
                            " and " (path->string (file-name-from-path (get-input-file 1)))))]
    [(3) (plot-lines 2 (string-append (path->string (file-name-from-path (get-input-file 0)))
                            ", " (path->string (file-name-from-path (get-input-file 1)))
                            " and " (path->string (file-name-from-path (get-input-file 2)))))]
    [(4) (plot-lines 3 (string-append (path->string (file-name-from-path (get-input-file 0)))
                            ", " (path->string (file-name-from-path (get-input-file 1)))
                            ", " (path->string (file-name-from-path (get-input-file 2)))
                            " and " (path->string (file-name-from-path (get-input-file 3)))))]))

(plot-files)
   
