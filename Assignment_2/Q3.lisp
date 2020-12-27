(defun removeduplicate (list);to remove duplicates not in order
    (cond ((null list) nil)
          ((not (member (car list) (cdr list))) (cons (car list) (removeduplicate (cdr list))))
          ((member (car list) (cdr list))   (removeduplicate(cdr list)))))

(defun removeduplicateorder (list);to remove duplicates in order
    (cond
        ((null list) list)
        (t (reverse(removeduplicate (reverse list))))))
    

(defun removechar (list);to remove the alphabets
    (cond ((null list) nil)
          ((numberp (car list)) (cons (car list) (removechar (cdr list))))
          (t (removechar (cdr list)))))

(defun flatten (list);to flatten the list without removing alphabets and duplicates
    (cond ((null list) nil)
          ((atom (car list)) (cons (car list) (flatten (cdr list))))
          (t (append (flatten (car list)) (flatten (cdr list))))))

(defun flatten-numbers (list)
   (removechar(removeduplicateorder (flatten list)))
   
    )


(print(flatten-numbers '(1 2 (3 1) (a 2.5) (2 4.5) ((1 2)))))
