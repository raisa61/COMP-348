;; Function creates a list named first that is empty and a list named second which has the original input.
;; We calculate half the lenght of the 'second' and then for that many times we append the head of 'second' to 'first' then
;; remove the head of 'second'. After the dotimes is finished, we output the first and second list.
(defun split (lst)
    (let ((first ())
          (second lst))
        (dotimes (i (/ (list-length second) 2))
            (setq first (append first (list (car second))))
            (setq second (cdr second)))
    (cons first (list second)))
)
    

;(print (split '(1 2 3 4)))
;(print (split '(1 2 3 4 5)))
;(print (split '(1 (2 3) 4 5 6)))