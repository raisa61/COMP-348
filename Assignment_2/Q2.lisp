;helper reverse function
(defun reverse2 (lst)
(cond ((null lst) '())
(t (append (reverse2 (cdr lst)) (list (car lst))))))
 
(defun split-up-to (l to)
    (cond
     ((<= to 0) ())
     ((null l) l)
     (t (cons (car l) (split-up-to (cdr l) (1- to))))
     )
    )


(defun sub-list (l from &optional (to (list-length l)))
    (cond
     ((null from) (sub-list l 1 to))
     ((> from to) (reverse2 (sub-list l to from)))
     ((<= from 1) (split-up-to l to))
     ((null l) l)
     ((null to) (sub-list l from '(list-length list)))
     (t (sub-list (cdr l) (1- from) (1- to)))
     )
    )

(print (sub-list '(1 6 12) 2))
(print (sub-list '(1 6 12) 3 1))
(print (sub-list '(1 6 12) nil 1))
