-- module Main where
-- main = print "Hello, World!"

-- module Main where
-- salutation = "Hello"
-- person = "Adam"
-- -- person = "Saima"
-- greeting = salutation <> " " <> person
-- main = print greeting


module Main where

makeGreeting salutation person = 
    salutation <> " " <> person

enthusiasticGreeting salutation = 
    makeGreeting (salutation <> "!!!!")

greetGeorge = (`makeGreeting` "George")



main = print "no sal to show yet"