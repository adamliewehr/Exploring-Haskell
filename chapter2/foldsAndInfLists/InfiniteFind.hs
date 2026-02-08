
import Prelude hiding (foldr)

foldr func carryValue lst = 
    if null lst
    then carryValue
    else func (head lst) $ foldr func carryValue (tail lst)

-- -- original implementation
-- findFirst predicate = 
--     foldr findHelper []
--     where
--         findHelper listElement maybeFound
--             | predicate listElement = [listElement]
--             | otherwise = maybeFound


-- -- using folr shape implementation
-- findFirst predicate carryValue lst = 
--     if null lst
--     then carryValue
--     else findHelper (head lst) $ findFirst predicate carryValue (tail lst)
--     where
--         findHelper listElement maybeFound
--             | predicate listElement = [listElement]
--             | otherwise = maybeFound

-- we know that if we do't find what we're looking for, then we'll always return an empty list
-- we can use this knowledge to simplify our code a little bit by removing
-- carryValue and replacing it with an empty list

-- findFirst predicate lst = 
--     if null lst
--     then []
--     else findHelper (head lst) $ findFirst predicate (tail lst)
--     where
--         findHelper listElement maybeFound
--             | predicate listElement = [listElement]
--             | otherwise = maybeFound

-- next, let's also move the definition of findHelper into the body of our function 
-- we'll refactor it a little bit, using an if expression rather than guards
-- so that we can make the code syntactically valid

-- findFirst predicate lst = 
--     if null lst
--     then []
--     else
--         if predicate (head lst)
--         then [head lst]
--         else findFirst predicate (tail lst)

-- finally, we're interested in understanding how we can fold over an infitnate list
-- so we can entirely remove the test to see if we've reached the end of our list
-- we can also use pattern matching so that we don't have to keep typing head and tail
-- we wouldn't want to do this in real-world code, since it means our function would crash if we gave it an empty list or even any finite list that doens't have a matching element

findFirst predicate (x:xs) = 
    if predicate x
    then x
    else findFirst predicate xs