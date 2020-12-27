(defun bst-add (item tree)
  (cond
   ((null tree) (list item '() '()))
   ((< item (first tree)) (list (first tree)
				(bst-add item (second tree))
				(third tree)))
   ((> item (first tree)) (list (first tree)
				(second tree)
				(bst-add item (third tree))))
   ;; element already exists in the tree:
   ;; do not put repeated, throw it away
   (t tree)
   )
  )

(defun make-cbtree (list)
  (let ((tree '()))
    (dolist (item list tree)
    (setf tree (bst-add item tree))
      )
    )
  )

(defun print-with-parentheses (l)
  (cond ((consp l) (format t "(")
              (do ((x l (cdr x)))
                  ((null x) (format t ")" ))
                (print-with-parentheses (car x))
                (when (cdr x) (format t " "))))
        (t (format t "~:a" l)) ))

(print-with-parentheses(make-cbtree '(8 3 10 1)));==>(8 (3 (1 () ()) ()) (10 () ())) NIL
(terpri)
(print-with-parentheses(make-cbtree '(8 3 10 1 6)));==>(8 (3 (1 () ()) (6 () ())) (10 () ())) NIL 
