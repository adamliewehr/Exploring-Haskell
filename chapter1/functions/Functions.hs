

-- makeGreeting salutation person = 
--     salutation <> " " <> person

-- greetPerson = makeGreeting "Hello"

-- -- here we are just changing the output of the first param
-- enthusiasticGreeting salutation = 
--     makeGreeting (salutation <> "!")

-- let bindings

-- we can make intermediate values with let bindings

makeGreeting salutation person = 
    let messageWithTrailingSpace = salutation <> " "
    in messageWithTrailingSpace <> person



madlib name verb place adj color item = 
    let 
        part1 = name <> " " <> verb <> " to the "
        part2 = place <> " and bought a " <> adj <> " " <> color <> " " <> item
    in
        part1 <> part2

-- we can reference bindings (these are just vars in the let binding I think)
-- that you define later int he same let expression
-- we don't have to define variables before we use them
-- we just need to make sure they actually get defined



extendedGreeting person = 
    let joinWithNewLines a b = a <> "\n" <> b
        helloAndGoodbye hello goodbye = 
            let hello' = makeGreeting hello person
                goodbye' = makeGreeting goodbye person
            in joinWithNewLines hello' goodbye'
        in helloAndGoodbye "Hello" "Goodbye"


-- where binding
-- follows the same rules as a let binding, except it comes at the end of a function instead of the beginning
-- any parameters that you've bound to a a variable name in your function will be available to your where binding
-- but not anything you've defined in a let binding 