(DEFPARAMETER *CCG-GRAMMAR*
  '(((KEY 1) (PHON A) (MORPH X) (SYN ((BCAT X) (FEATS NIL)))
     (SEM (LAM Z ((LAM Y (Y (LAM X X))) (LAM X (Z X))))) (PARAM 1.0))
    ((KEY 2) (PHON B) (MORPH X) (SYN ((BCAT X) (FEATS NIL)))
     (SEM ((LAM X (LAM Y ((Z X) (LAM U (U X))))) (LAM X (W X)))) (PARAM 1.0))
    ((KEY 3) (PHON C) (MORPH X) (SYN ((BCAT X) (FEATS NIL)))
     (SEM (LAM F (LAM G (LAM X ((F X) GX))))) (PARAM 1.0))
    ((KEY 4) (PHON D) (MORPH X) (SYN ((BCAT X) (FEATS NIL)))
     (SEM (((X Y) (Y Z)) Z)) (PARAM 1.0))))