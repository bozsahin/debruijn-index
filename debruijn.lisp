;; Common Lisp code for de Bruijn indexing
;; - cem bozsahin

(defmacro bindp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 3)))  ; assuming it is (LAM V B) if well-formed

(defmacro binarybp (lterm)
  `(and (listp ,lterm) (= (length ,lterm) 2)))  ; complex bodies are assumed binarized

(defmacro unarybp (lterm)
  `(or (atom ,lterm) (and (listp ,lterm) (= (length ,lterm) 1))))

(defmacro l-get-body (lterm)
  `(third ,lterm))

(defun debruijn (lterm &optional (dterm nil) (bl nil))
  "build the debruijn term dterm from lambda term lterm using binding list bl"
  (cond ((null lterm) (values dterm bl))
	((bindp lterm) (debruijn (l-get-body lterm) 
				 (mk-dterm-bind lterm dterm) (mk-bl lterm bl)))
	((binarybp lterm) (debruijn (l-get-body21 lterm ) 
				    (mk-dterm-bin lterm dterm) bl))
	((unarybp  lterm) (debruijn (l-get-body1 lterm)
			            (mk-dterm-un  lterm dterm) bl))
	(t (debruijn nil))))

