{- HLINT ignore "Use guards" -}
module Main where
import Control.Monad (guard)

printSmallNumber num = 
    if num < 10
    then print num
    else print "the number is too big!"

sizeNumber num = 
    if num < 3
    then "thats a small number!"
    else
        if num < 10
        then "thats a medium sized number"
        else "that's a big number"

guardSize num
    | num < 3 = "thats a small number"
    | num < 10 = "thats a medium number"
    | num < 100 = "thats a pretty big number"
    | num < 1000 = "thats a giant number"
    | otherwise = "pretty pretty pretty pretty big"
main = print (guardSize 10000)
