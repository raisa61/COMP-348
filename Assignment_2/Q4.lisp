(defun leafp (L);leaf checking
    (cond
        ((null L) t)
    (t(and (= (list-length L) 1) (listp L) ))
        )
    )

(defun nodep (L);node checking
    (and (= (list-length L) 3) (listp L))
    )

(defun get-node(L);getting the node value
    (car L)   
    )

(defun get-left (L);getting the left node
   (car (cdr L))
    )

(defun get-right (L);getting the right node
    (car(cdr(cdr L)))
    )

(defun checkleft (L);checking left subtree condition
    (cond
        ((null(get-left L)) t)
        ((< (car(get-left L)) (get-node L))t)
        )
    )

(defun checkright (L);checking right subtree condition
    (cond
        ((null(get-right L)) t)
        ((> (car(get-right L)) (get-node L))t)
       )  
    )

(defun binaryp (L)
    (cond
        ((null L) t)
        ((leafp L) t)
        ((and (nodep L) (leafp (get-left L)) (leafp (get-right L)))   (and (checkleft L) (checkright L)));if all children are leaves
        ((and (nodep L) (nodep (get-left L)) (leafp (get-right L)))   (and (binaryp (get-left L)) (checkleft L) (checkright L)));if left is node and right is leaf
        ((and (nodep L) (leafp (get-left L)) (nodep (get-right L)))   (and (checkleft L) (binaryp (get-right L)) (checkright L)));if right is node and left is leaf
        ((and (nodep L) (nodep (get-left L)) (nodep (get-right L)))   (and (binaryp (get-left L)) (binaryp (get-right L)) (checkleft L) (checkright L)));if all children are nodes
        )  
    )


(print(binaryp '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13) ())))))