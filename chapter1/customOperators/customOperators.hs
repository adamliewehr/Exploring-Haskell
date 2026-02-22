module Main where
-- custom addition operator

-- (+++)

-- prefix form
(+++) a b = a+b

-- infix form
a +++ b = a + b

infixl 6 +++

main = print "something"