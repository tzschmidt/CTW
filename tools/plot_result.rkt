#lang racket
(require plot)

(define output-file
  (if (vector-empty? (current-command-line-arguments))
      "../examples/A031.png"
      (first (vector->list (current-command-line-arguments)))))

(define input-file0
  (if (< (vector-length (current-command-line-arguments)) 2)
      "../examples/A031_clingcon.txt"
      (second (vector->list (current-command-line-arguments)))))

(define input-file1
  (if (< (vector-length (current-command-line-arguments)) 3)
     #f
      (third (vector->list (current-command-line-arguments)))))

(define input-file2
  (if (< (vector-length (current-command-line-arguments)) 4)
      #f
      (fourth (vector->list (current-command-line-arguments)))))

(define input-file3
  (if (< (vector-length (current-command-line-arguments)) 5)
      #f
      (fifth (vector->list (current-command-line-arguments)))))

(define input-files-list
  (let* ([file01 (if input-file1 (list input-file0 input-file1) (list input-file0))]
         [file012 (if input-file2 (append file01 (list input-file2)) file01)]
         [file0123 (if input-file3 (append file012 (list input-file3)) file012)])
    (if file0123 file0123 #f)))

(define (get-input-file x)
  (list-ref input-files-list x))

; get encoding name from file
(define (get-name-line file)
  (car (filter (lambda (line) (regexp-match #rx"\\.lp \\.\\.\\." line))
          (sequence->list (in-lines file)))))

(define (get-name file)
  (let* ([nameline (call-with-input-file file get-name-line)]
         [name (second (regexp-match #px"\\/([\\w]+)\\.lp" nameline))])
    (if (string=? "encoding" name) "flatzingo" name)))

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

; plotting
(define (lines-for-plot x style)
  (let* ([file (get-input-file x)]
         [values (filtered-plot-values file)]
         [checked-values (if (null? values) (list (list 0 0)) values)]
         [pre-opt-values (opt-values file)]
         [checked-opt-values (if (null? pre-opt-values) (list 0) pre-opt-values)])
    (lines (beautify-plot-values checked-values)
           #:x-min (* 0.9 (first (first checked-values)))
           #:x-max (* 1.1 (first (last checked-values)))
           #:y-min (* (apply min checked-opt-values) 0.9)
           #:y-max (* (apply max  checked-opt-values) 1.1)
           #:label (get-name file)
           #:style style)))

(define (plot-lines x title)
  (plot-file
   #:x-label "time in ms"
   #:y-label "optimization value"
   #:title title
   (case x
     [(0) (list (lines-for-plot 0 'solid))]
     [(1) (list (lines-for-plot 0 'solid) (lines-for-plot 1 'long-dash))]
     [(2) (list (lines-for-plot 0 'solid) (lines-for-plot 1 'long-dash) (lines-for-plot 2 'short-dash))]
     [(3) (list (lines-for-plot 0 'solid) (lines-for-plot 1 'long-dash) (lines-for-plot 2 'short-dash) (lines-for-plot 3 'dot))])
   output-file 'png))

(define (plot-files)
  (plot-lines (- (length input-files-list) 1) (second (regexp-match #px"\\/([\\w]+)\\.png" output-file))))

(plot-files)
   
