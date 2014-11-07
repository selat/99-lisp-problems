(defun drop (l num)
  (labels ((drop* (l cur)
             (cond ((null l) nil)
                   ((= cur num) (drop* (rest l) 1))
                   (t (cons (first l) (drop* (rest l) (1+ cur)))))))
    (drop* l 1)))

(defun drop (l num)
  (do ((i 1 (1+ i)) (res nil))
      ((null l) (reverse res))
    (if (< i num)
        (setf res (cons (first l) res))
        (setf i 0))
    (setf l (rest l))))
