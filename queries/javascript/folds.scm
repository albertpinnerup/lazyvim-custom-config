; extends

(jsx_element) @fold
(jsx_self_closing_element) @fold
(parenthesized_expression (jsx_element) @fold)
(parenthesized_expression (jsx_self_closing_element) @fold)
(parenthesized_expression) @fold
(return_statement
    (parenthesized_expression) @fold)
(jsx_expression) @fold

;; fold all JSX elements
(jsx_element) @fold
(jsx_self_closing_element) @fold

;; fold {cond && (<JSX>)} expressions
(jsx_expression
  (binary_expression
    right: (parenthesized_expression
      (jsx_element) @fold)))

(jsx_expression
  (binary_expression
    right: (parenthesized_expression
      (jsx_self_closing_element) @fold)))

;; fold ternaries {cond ? (<JSX>) : (<JSX>)}
(jsx_expression
  (ternary_expression
    consequence: (parenthesized_expression (jsx_element) @fold)
    alternative: (parenthesized_expression (jsx_element) @fold)))

(jsx_expression
  (ternary_expression
    consequence: (parenthesized_expression (jsx_self_closing_element) @fold)
    alternative: (parenthesized_expression (jsx_self_closing_element) @fold)))
