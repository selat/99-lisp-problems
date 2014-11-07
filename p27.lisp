(defun group (lst groups)
  (let ((res nil))
    (labels ((group* (lst groups prefix)
               (if (null groups) (setq res (cons (reverse prefix) res))
                   (mapcar #'(lambda (x)
                               (group* (remove-if #'(lambda (e) (find e x)) lst)
                                       (rest groups)
                                       (cons x prefix)))
                           (combination (first groups) lst))))))
    (group* lst groups nil))
  (reverse res)))

(defun check-group (res)
  (do ((x (first res) (first r)) (r (rest res) (rest r)) (accepted t))
      ((and (null x) (not accepted)) accepted)
    (if (find x r) (setq accepted nil))))
