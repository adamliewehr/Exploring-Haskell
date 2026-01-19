module Main where

makeGreeting salutation person =
   let messageWithTrailSpace = salutation <> " "
   in messageWithTrailSpace <> person

-- extendedGreeting person = 
--     let hello = makeGreeting helloStr person
--         goodDay = makeGreeting "I hope you have a nice afternoon" person
--         goodBye = makeGreeting "See you later" person
--         helloStr = "Hello"

--     in hello <> "\n" <> goodDay <> "\n" <> goodBye

extendedGreeting person = 
    let joinWithNewlines a b = a <> "\n" <> b
        helloAndGoodbye hello goodbye = 
            let hello' = makeGreeting hello person
                goodbye' = makeGreeting goodbye person
            in joinWithNewlines hello' goodbye'
        in helloAndGoodbye "Hello" " Goodbye"

letWhereGreeting name place =
    let
        salutation = "Hello" <> name
        meetingInfo = location "Tuesday"
    in salutation <> " " <> meetingInfo
    where
        location day = "we met at " <> place <> " on a " <> day

main = print $ makeGreeting "Hello" "Adam"

