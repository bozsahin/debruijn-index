;; Common Lisp code for de Bruijn indexing
;; - cem bozsahin

(defmacro bindp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 3)))  ; assuming it is (LAM V B) if well-formed

(defmacro binarybp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 2)))  ; complex bodies are assumed binarized

(defmacro unarybp (lterm)
  `(or (atom ,lterm) (and (listp ,lterm) (= (length ,lterm) 1)))) ; simple bodies may include lambdas

(defmacro l-get-bb (lterm)
  `(third ,lterm))

(defmacro l-get-vv (lterm)
  `(second ,lterm))

(defmacro mk-bl (v bl lev)
  `(if (null ,bl) 
     (cons (list ,v (+ ,lev 1))  ,bl) 
     (list (list ,v (+ ,lev 1))  ,bl)))

(defmacro mk-dterm-bind (dterm)
  `(list 'LAM ,dterm))

(defmacro mk-dterm-bin (d1 d2)
  `(list ,d1 ,d2))

(defmacro l-get-b21 (lterm)
  `(first ,lterm))

(defmacro l-get-b22 (lterm)
  `(second ,lterm))

(defmacro debr-index (lterm bl)
  `(second (assoc ,lterm ,bl)))

(defmacro free (lterm bl)
  `(null (assoc ,lterm ,bl))) 

(defmacro constantbp (lterm bl)
  `(or (constantp ,lterm) (free ,lterm ,bl)))

(defun debruijn (lterm &optional (dterm nil) (bl nil) (l 0))
  "build the l level debruijn term dterm 
  from lambda term lterm using binding list bl"
  (cond ((null lterm) dterm)
	((bindp lterm) (debruijn (l-get-bb lterm) 
				 (mk-dterm-bind  dterm) 
				 (mk-bl (l-get-vv lterm) bl l)
				 (+ l 1)))
	((binarybp lterm) (mk-dterm-bin (debruijn (l-get-b21 lterm) nil bl 0)
					(debruijn (l-get-b22 lterm) nil bl 0)))
	((constantbp  lterm bl) lterm)
	(t (debr-index lterm bl))))

