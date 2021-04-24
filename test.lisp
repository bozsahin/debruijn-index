;; input in native lambda term format; where LAM stands for lambda
;; Lambda bindinds are triplets (LAM V B) where V is binding occurence of variable V, and B is body
;; Lambda bodies are unary values E (variables, constants), or binary application (E1 E2) where Ei are lambda terms
(dolist (lt '( (LAM Z ((LAM Y (Y (LAM X X))) (LAM X (Z X))))  
	      ((LAM X (LAM Y ((Z X) (LAM U (U X))))) (LAM X (W X)))
	      (LAM F (LAM G (LAM X ((F X) (G X)))))
	      (LAM X (LAM Y (((LAM X (A (LAM X B))) Y) (LAM Y (Y X)))))
	      (((X Y) (Y Z)) Z)
	      (LAM X1 (LAM P1 (LAM X2 ((("PERSUADE" (P1 X1)) X1) X2))))
	      (LAM X1 (LAM P1 (LAM X2 ((("PROMISE" (P1 X2)) X1) X2))))
	      (LAM X1 (LAM P1 (LAM X2 (("EXPECT" (P1 X1)) X2))))))
  (format t "~%Lambda term   : ~A~%de Bruijn term: ~A~%" lt (debruijn lt)))
