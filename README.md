# debruijn-index
Finding de Bruijn indices of a lambda term, by generating nameless bound variables. Free variables remain unchanged.

`(debruijn lterm)`  returns the de Bruijn-indexed version of the lambda term `lterm`.

Under the hood, it returns two values, using the `values` primitive of Common Lisp. The first one is the de Bruijn term of the lambda term.
The second one is the binding list, in the precedence  of name shadowing, which is obtained in getting the term.

You can simply use the first result just like any function return value, or use `multiple-value-bind` to have access to both results.

NB. `lterm` is not Common Lisp's `lambda` term. The reason is that not every compiler allows you to see the inside of a closure.

There are three kinds of lambda terms:

- `LAM V B`  : `V` is the variable, `B` is the unary or binary lambda body. `LAM` is the keyword, fashioned after Alessandro Cimatti's lambda calculus ADT (many thanks!)

- `E` : unary lambda body, constant, variable or a unary lambda term.

- `E1 E2` : binary lambda body. 

enjoy.

-cem bozsahin
