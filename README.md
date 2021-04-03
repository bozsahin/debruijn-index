# debruijn-index
Finding de Bruijn indices of a lambda term, by generating nameless bound variables. Free variables remain unchanged.

`(debruijn lterm)`  returns the de Bruijn-indexed version of the lambda term `lterm`.

Under the hood, it returns two values, using the `values` primitive of Common Lisp. The first one is the de Bruijn term of the lambda term.
The second one is the binding list, in the precedence  of name shadowing, which is obtained in getting the term.

You can simply use the first result just like any function return, or use `multiple-value-bind` to have access to both results.

enjoy.
-cem bozsahin
