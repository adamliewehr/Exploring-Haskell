import Control.Arrow (Arrow(first))

-- fibs firstFib secondFib = 
--     let nextFib = firstFib+secondFib
--     in firstFib : fibs secondFib nextFib

-- refacored

-- fibs = 
--     fibsHelper 0 1
--     where 
--         fibsHelper firstFib secondFib = 
--             let nextFib = firstFib + secondFib
--             in firstFib : fibsHelper secondFib nextFib

-- even more refactored

fibs = 0 : 1 : helper fibs (tail fibs)
    where
        helper (a:as) (b:bs) = 
            a+b : helper as bs