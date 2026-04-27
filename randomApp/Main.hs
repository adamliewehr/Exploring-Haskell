import System.Random (randomRs, mkStdGen)
import Data.Time.Clock (getCurrentTime)
import Data.Time.Clock.POSIX (utcTimeToPOSIXSeconds)

-- Roll a single die (returns value 1-6)
rollDie :: Int -> Int
rollDie seed = (randomRs (1, 6) (mkStdGen seed) :: [Int]) !! 0

-- Roll multiple dice and return the list of results
rollDice :: Int -> Int -> [Int]
rollDice numDice seed = take numDice (randomRs (1, 6) (mkStdGen seed) :: [Int])

-- Simulate rolling two dice multiple times and track the sum distribution
simulateRolls :: Int -> [Int]
simulateRolls numSimulations = map (\i -> sum (rollDice 2 i)) [1..numSimulations]

main :: IO ()
main = do
    putStrLn "Dice Roller using Random Numbers"
    putStrLn "=================================\n"
    
    -- Get current time as seed for randomness
    now <- getCurrentTime
    let seed = round (utcTimeToPOSIXSeconds now) :: Int
    
    -- Example 1: Single die roll
    putStrLn "Single Die Roll:"
    putStrLn $ "  Result: " ++ show (rollDie seed)
    
    -- Example 2: Roll multiple dice
    putStrLn "\nRoll 5 Dice:"
    let fiveDice = rollDice 5 (seed + 1)
    putStrLn $ "  Results: " ++ show fiveDice
    putStrLn $ "  Sum: " ++ show (sum fiveDice)
    
    -- Example 3: Simulate many rolls of two dice
    putStrLn "\nSimulate 1000 rolls of 2 dice:"
    let simulations = simulateRolls 1000
    let simResults = map (\i -> sum (rollDice 2 (seed + i))) [1..1000]
    putStrLn $ "  Min sum: " ++ show (minimum simResults)
    putStrLn $ "  Max sum: " ++ show (maximum simResults)
    putStrLn $ "  Average sum: " ++ show (fromIntegral (sum simResults) / fromIntegral (length simResults) :: Double)
