module PatternMatching where


customGreeting "George" = "Oh, hey george!"
customGreeting name = "hello" <> name


-- pattern matching lets us have two or more implementations of the same function
-- but, when the function is called with a value that is "pattern matched" (this is definetly not the right way to phrase this)
-- the function matching that values gets run, not the general one