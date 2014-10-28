(defun encode-direct (l)
  (if (null l) nil
	  (labels ((get-next-element-and-iterator (l element num)
				 (if (equal (first l) element)
					 (get-next-element-and-iterator (rest l) element (1+ num))
					 (values (if (> num 1)
								 (list num element)
								 element)
							 l))))
		(multiple-value-bind (elem nextl)
			(get-next-element-and-iterator l (first l) 0)
		  (cons elem (encode-direct nextl))))))
