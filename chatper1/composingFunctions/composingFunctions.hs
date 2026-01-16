module Main where
addOne num = num + 1
timesTwo num = num *2
squared :: Num a => a -> a
squared num = num*num
minusFive num=num-5

findResult num = minusFive (squared (timesTwo (addOne num)))

main = print "test"