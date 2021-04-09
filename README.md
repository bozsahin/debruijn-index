# debruijn-index
Finding de Bruijn indices of a lambda term, by generating nameless bound variables. Free variables remain unchanged.

`(debruijn lterm)`  returns the de Bruijn-indexed version of the lambda term `lterm`.

NB. `lterm` is not Common Lisp's `lambda` term. The reason is that not every compiler allows you to see the inside of a closure.

There are three kinds of lambda terms:

- `LAM V B`  : `V` is the binding occurrence of the variable, `B` is the  lambda body. `LAM` is the keyword, fashioned after Alessandro Cimatti's lambda calculus ADT (many thanks!)

There are two kinds of lambda bodies, assumed to be with only necessary amount of parenthesization.

- `E` : unary lambda body: constant, variable or a unary lambda term in parentheses.

- `(E1 E2)` : binary lambda body. 

enjoy.

-cem bozsahin
