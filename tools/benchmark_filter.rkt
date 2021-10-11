#lang racket

(define input-file
  (if (vector-empty? (current-command-line-arguments))
      "./A031.dzn"
      (first (vector->list (current-command-line-arguments)))))

(define output-file
  (if (vector-empty? (current-command-line-arguments))
      "./A031_new.dzn"
      (second (vector->list (current-command-line-arguments)))))

(define input-k-string
  (if (vector-empty? (current-command-line-arguments))
      "10"
      (third (vector->list (current-command-line-arguments)))))

(define (k-string k)
  (string-append "k = " (number->string k) ";"))

(define input-b-string
  (if (vector-empty? (current-command-line-arguments))
      "5"
      (fourth (vector->list (current-command-line-arguments)))))

(define (b-string b)
  (string-append "b = " (number->string b) ";"))

; get lines from file
(define (get-lines file)
   (sequence->list (in-lines file)))
  
; get lines from input
(define input-lines (call-with-input-file input-file get-lines))

; write lines to file
(define (write-to-file path lines)
  (call-with-output-file path
    (lambda (output-port)
      (for/list ([line lines])
        (displayln line output-port))) #:exists 'replace))

; get new lines (add new definitions of k and b)
(define (new-lines k b lines)
  (append (list (k-string k) (b-string b)) (filter (lambda (line) (keep-line k line)) lines)))

; keep all lines with values <= k
(define (keep-line k line)
  (foldl (lambda (x y) (and x y)) #t (map (lambda (value) (>= k value)) (get-values line k))))

; get values of lines
(define (get-values line k)
  (let* ([match1 (regexp-match #px"([\\d]+)\\, ([\\d]+)" line)]
         [match2 (regexp-match #px"([\\d]+)\\, ([\\d]+)\\, ([\\d]+)\\, ([\\d]+)" line)]
         [match3 (regexp-match #px"\\S = ([\\d]+);" line)]
         [lines1 (if match1
                     (list (string->number (second match1))
                           (string->number (third match1)))
                     '())]
         [lines2 (if match2
                     (list (string->number (second match2))
                                    (string->number (third match2))
                                    (string->number (fourth match2))
                                    (string->number (fifth match2)))
                     '())]
         ; remove k and b definitions
         [lines3 (if match3
                     (list (+ k 1)) '())])
    (append lines1 lines2 lines3)))

; execute programm
(write-to-file output-file (new-lines (string->number input-k-string) (string->number input-b-string) input-lines))

;(write-to-file "./test.txt" '("   1, 20|" "   1, 20, 33, 4|"))

; embedded unit test to check if correct lines are kept
(module+ test
  (require rackunit)
  (check-equal? (keep-line 30 "   1, 20|")  #t)
  (check-equal? (keep-line 30 "b = 2;")  #f)
  (check-equal? (keep-line 30 "   1, 34|")  #f)
  (check-equal? (keep-line 30 "   1, 20, 3, 4|")  #t)
  (check-equal? (keep-line 30 "   1, 20, 33, 4|")  #f)
  (check-equal? (new-lines 30 13 '("Tree" "   1, 33|"))  '("k = 30;" "b = 13;" "Tree"))
  (check-equal? (new-lines 27 10'("b = 2;" "   1, 34|" "   1, 20, 3, 4|"))  '("k = 27;" "b = 10;" "   1, 20, 3, 4|"))
  (check-equal? (new-lines 30 7'("k = 3;" "b = 1;" "   1, 20|" "   1, 20, 33, 4|"))  '("k = 30;" "b = 7;" "   1, 20|")))