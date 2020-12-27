;; Function that is called by user, then calls either create_left_triangle or create_right_triangle
;; since no instructions were given for the case of (triangle 0), we print "no triangle"
(defun triangle (num)
    (if (> num  0) (create_left_triangle num))
    (if (< num 0) (create_right_triangle (* -1 num) (* -1 num)))
    (if (= num 0) (print "no triangle"))
)

;; Recursive function that creates the left triangle. Prints "*" the specified number of times, then makes a new line
;; then calls the function again for (- n 1) so the next line will print one less, and so on.
;; Stops after n = 1.
(defun create_left_triangle (n)
    (if (> n 0)
        (dotimes (i n)
            (prin1 "*")))
    (terpri)
    (if (> n 0)
        (create_left_triangle (- n 1)))
)

;; Recursive function that creates the left triangle. Prints " " a number of times equal to (original number n) - (number n in this iteration),
;; prints "*" the specified number of times, makes a new line, then calls the function again for (- n 1) so the next line will print one less "*",
;;; and one more " " and so on.
;; Stops after n = 1.
(defun create_right_triangle (n orig_n)
    (if (> n 0)
        (dotimes (i (- orig_n n))
            (prin1 " ")))
    (if (> n 0)
        (dotimes (i n)
            (prin1 "*")))
    (terpri)
    (if (> n 0)
        (create_right_triangle (- n 1) orig_n))
)

;(triangle 7)
;(triangle 4)
;(triangle -5)
;(triangle -1)
