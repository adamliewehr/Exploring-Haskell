


pairwiseSum xs ys = 
    let sumElems pair = let a = fst pair
                            b = snd pair
                        in a + b 
    in map sumElems $ zip xs ys

