

partialFunction 0 = "I only work for 0"
-- partialFunction impossibleValue = error $ 
--     "I only work with 0 but I was called with " <> show impossibleValue

main = putStrLn $ partialFunction 3