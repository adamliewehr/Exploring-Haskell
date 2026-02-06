module PatternMatching where


customGreeting "George" = "Oh, hey george!"
customGreeting name = "hello" <> name


-- pattern matching lets us have two or more implementations of the same function
-- but, when the function is called with a value that is "pattern matched" (this is definetly not the right way to phrase this)
-- the function matching that values gets run, not the general one

matchTuple ("hello", "world") = "Hello there, you great big world"
matchTuple ("hello", name) = "oh, hi there, " <> name
matchTuple(salutation, "George") = "Oh! " <> salutation <> " George!"
matchTuple n = show n

modifyPair p@(a,b)
    | a == "Hello" = "this is a salutation"
    | b == "George" = "this is a message for george"
    | otherwise = "I don't know what " <> show p <> " means"