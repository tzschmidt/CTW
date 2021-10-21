#lang racket
; program to cut benchmarks up to a specific k value
; usage: benchmark_filter <to-be-cut-benchmark.dzn> <new-benchmark.dzn> <k> <b>
; where b<=k/2

; get input file
(define input-file
  (if (vector-empty? (current-command-line-arguments))
      "../examples/A031.dzn"
      (first (vector->list (current-command-line-arguments)))))

; get output file
(define output-file
  (if (< (vector-length (current-command-line-arguments)) 2)
      "../examples/A031_new.dzn"
      (second (vector->list (current-command-line-arguments)))))

; get new k as string
(define input-k-string
  (if (< (vector-length (current-command-line-arguments)) 3)
      "10"
      (third (vector->list (current-command-line-arguments)))))

; create new k line
(define (k-string k)
  (string-append "k = " (number->string k) ";"))

; get new b as string
(define input-b-string
  (if (vector-empty? (current-command-line-arguments))
      "5"
      (fourth (vector->list (current-command-line-arguments)))))

; create new b line
(define (b-string b)
  (string-append "b = " (number->string b) ";"))

; prep input string
(define (prep-input file)
  (regexp-replace* #px"(\\S)(\\])"
                   (regexp-replace* #px"([\\s]+\\[\\|)(\\S)" (file->string file) "\\1\n\\2")
                   "\\1\n\\2"))

; get lines from file
(define (get-lines file)
  (string-split (prep-input file) "\n"))

; write to file
(define (write-to-file path string)
  (display-to-file string path #:exists 'replace))

; create final string with missing ];
(define (final-string lines)
  (regexp-replace* #px"(\\[)\\|(\\])"
                  (regexp-replace* #px"(\\S)\n(\\])" (string-join lines "\n") "\\1\\2")
                  "\\1\\2"))

; get new lines (add new lines for k and b)
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

; execute program
(if (write-to-file output-file (final-string (new-lines (string->number input-k-string) (string->number input-b-string) (get-lines input-file))))
    (displayln "Finished writing.")
    (displayln "Internal error."))

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
  (check-equal? (new-lines 30 7'("k = 3;" "b = 1;" "   1, 20|" "   1, 20, 33, 4|"))  '("k = 30;" "b = 7;" "   1, 20|"))
  (check-equal? (final-string '("Atom = [" "]" "4|" "];")) "Atom = []\n4|];")) 