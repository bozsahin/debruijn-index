;; Common Lisp code for de Bruijn indexing
;; - cem bozsahin

(defmacro bindp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 3)))  ; assuming it is (LAM V B) if well-formed

(defmacro binarybp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 2)))  ; complex bodies are assumed binarized

(defmacro unarybp (lterm)
  `(or (atom ,lterm) (and (listp ,lterm) (= (length ,lterm) 1)))) ; simple bodies may include lambdas

(defmacro l-get-b (lterm)
  `(third ,lterm))

(defmacro l-get-v (lterm)
  `(second ,lterm))

(defun debruijn (lterm &optional (dterm nil) (bl nil) (l 0))
  "build the l level debruijn term dterm 
  from lambda term lterm using binding list bl"
  (cond ((null lterm) dterm)
	((bindp lterm) (debruijn (l-get-b lterm) 
				 (mk-dterm-bind lterm dterm) 
				 (mk-bl (l-get-v lterm) bl l)
				 (+ l 1)))
	((binarybp lterm) (debruijn (l-get-b21 lterm) 
				    (mk-dterm-bin lterm dterm) 
				    bl l)
					(debruijn (l-get-b22 lterm) 
						  (mk-dterm-bin lterm dterm) 
						  bl l)
	((unarybp  lterm) (debruijn (l-get-body1 lterm)
			            (mk-dterm-un  lterm dterm) 
				    bl l))
	(t (debruijn nil))))

