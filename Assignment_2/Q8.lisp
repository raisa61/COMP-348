(defun lucas (n &optional (a 2) (b 1))
  (if (or(< n 0) (zerop n))
      nil
      (cons a (lucas (- n 1) b (+ a b))))) 

(print(lucas -1)); ==> NIL 
(print(lucas 9)); ==> (2 1 3 4 7 11 18 29 47) 
