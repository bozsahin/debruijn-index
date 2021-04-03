# debruijn-index
Finding de Bruijn indices of a lambda term, by generating nameless bound variables. Free variables remain unchanged.

`(debruijn lterm)` IS IT <code>(debruijn lterm)</code> returns the de Bruijn-indexed version of the lambda term <code>lterm</code>.

Under the hood, it returns two values, using the <code>values</code> primitive of Common Lisp. The first one is the de Bruijn term of the lambda term.
The second one is the binding list, in the precedence  of name shadowing, which is obtained in getting the term.

You can simply use the first result just like any function return, or use <code>multiple-value-bind</code> to have access to both results.

enjoy.
-cem bozsahin
