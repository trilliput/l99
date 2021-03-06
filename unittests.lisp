;;;; Tests for problems 1-15

;;; Load lisp-unit package
(load "libs/lisp-unit.lisp")
(use-package 'lisp-unit)

;;; Load all problems
(load "1.lisp")
(load "2.lisp")
(load "3.lisp")
(load "4.lisp")
(load "5.lisp")
(load "6.lisp")
(load "7.lisp")
(load "8.lisp")
(load "9.lisp")
(load "10.lisp")
(load "11.lisp")
(load "12.lisp")
(load "14.lisp")
(load "15.lisp")
(load "16.lisp")
(load "17.lisp")

(define-test "Problem 01"
  (assert-equal nil (my-last nil))
  (assert-equal "last" (my-last '(1 2 3 "last"))))

(define-test "Problem 02"
  (assert-equal '("pre-last" "last") (my-but-last '(1 2 3 "pre-last" "last")))
  (assert-equal '("only-one") (my-but-last '("only-one")))
  (assert-equal nil (my-but-last nil)))

(define-test "Problem 03"
  (dolist (i '((('(1 2 "pre-last" "last") '0) 1)
               (('(1 2 "pre-last" "last") '4) "last") 
               (('(0) '0) 0)))
    (assert-equal (second i) (eval (append (list 'element-at) (first i))))))

(define-test "Problem 04"
  (dolist (i '((() 0) ((0 1) 2) ((0 1 2 3) 4) ((0 1 2 3 4 5 6) 7)))
    (assert-equal (second i) (my-length (first i)))))

(define-test "Problem 05"
  (dolist (i '((() ()) ((0 1) (1 0)) ((0 1 2 3) (3 2 1 0)) ((0 1 (5 6)) ((5 6) 1 0))))
    (assert-equal (second i) (my-reverse (first i)))))

(define-test "Problem 06"
  (dolist (i '((Nil T) ((1 2 1) T) ((0 1) Nil) ((1) T) ))
    (assert-equal (second i) (my-is-polindrome (first i)))))

(define-test "Problem 07"
 (dolist (i '(((Nil) (Nil))
              (Nil Nil)
              ((1 2 3) (1 2 3)) 
              (((1 (2 3)) 4 5 (6 7)) (1 2 3 4 5 6 7)) 
              ((T) (T))))
   (assert-equal (second i) (my-flatten (first i)))))

(define-test "Problem 08"
  (dolist (i '((Nil Nil)
               ((1 2 3) (1 2 3)) 
               ((1 1 1 1 1 2 2 2 2 3 3 4 5 5) (1 2 3 4 5)) 
               ((a a a a b c c a a d e e e e) (a b c a d e))))
    (assert-equal (second i) (eliminate-duplicates (first i)))))

(define-test "Problem 09"
(dolist (i '((Nil (Nil))
             ((a a a a b c c a a d e e e e) ((A A A A) (B) (C C) (A A) (D) (E E E E))) 
             ((1 1 1 1 1 2 2 2 2 3 3 4 5 5) ((1 1 1 1 1) (2 2 2 2) (3 3) (4) (5 5)))
             ((a) ((a)))))
  (assert-equal (second i) (pack (first i)))))

(define-test "Problem 10"
  (dolist (i '((Nil Nil)
               ((a a a a b c c a a d e e e e) ((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))) 
               ((1 1 1 1 1 2 2 2 2 3 3 4 5 5) ((5 1) (4 2) (2 3) (1 4) (2 5)))
               ((a) ((1 a)))))
    (assert-equal (second i) (encode-list (first i)))))

(define-test "Problem 11"
  (dolist (i '((Nil Nil)
               ((a a a a b c c a a d e e e e) ((4 A) B (2 C) (2 A) D (4 E))) 
               ((1 1 1 1 1 2 2 2 2 3 3 4 5 5) ((5 1) (4 2) (2 3) 4 (2 5)))
               ((a) (a))))
    (assert-equal (second i) (encode-list-ext (first i)))))

(define-test "Problem 12"
  (dolist (i '((Nil Nil)
               (((4 a) b (2 c) (2 a) d (4 e)) (a a a a b c c a a d e e e e)) 
               (((5 1) (4 2) (2 3) 4 (2 5)) (1 1 1 1 1 2 2 2 2 3 3 4 5 5))
               ((a) (a))))
    (assert-equal (second i) (decode (first i)))))

(define-test "Problem 14"
  (dolist (i '((Nil Nil)
               ((a b c d) (a a b b c c d d)) 
               ((1 2) (1 1 2 2))
               ((a) (a a))))
    (assert-equal (second i) (dupli (first i)))))

(define-test "Problem 15"
  (dolist (i '((('(a) '1) (a))
               (('(a b c d) '2) (a a b b c c d d)) 
               (('(1 2) '4) (1 1 1 1 2 2 2 2))
               (('(a) '8) (a a a a a a a a))))
    (assert-equal (second i) (eval (append (list 'repli) (first i))))))

;;; Skipped test
(define-test "problem 16"
  (dolist (i '((('(a) '1) ())
               (('(a b c d) '2) (a c)) 
               (('(1 2) '4) (1 2))
               (('(a b c d e f g h i) '4) (a b c e f g i))))
    ;; Skipped tests
    '(assert-equal (second i) (eval (append (list 'drop) (first i))))))

(define-test "Problem 17"
  (dolist (i '((('() '0) ())
               (('(a b c d) '2) ((a b) (c d))) 
               (('(1 2) '4) (1 2))
               (('(a b c d e f g h i) '4) ((a b c d) (e f g h i)))))
    (assert-equal (second i) (eval (append (list 'split) (first i))))))

(run-tests)

