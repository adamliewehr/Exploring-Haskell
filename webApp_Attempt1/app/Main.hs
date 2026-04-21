{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Network.Wai.Middleware.Static (staticPolicy, addBase)

import System.Environment (getArgs)
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

data MyData = MyData { info :: String } deriving (Show, Generic)

instance FromJSON MyData
instance ToJSON MyData

runWeb :: IO ()
runWeb = scotty 3000 $ do
    -- This serves your index.html and JS automatically
    middleware $ staticPolicy (addBase "static")

    get "/" $ file "static/index.html"

    post "/submit" $ do
        payload <- jsonData  -- Automatically parses incoming JSON
        json $ MyData { info = "Haskell received: " ++ info payload }












type Position = (Float, Float)
type Velocity = (Float, Float)

data World = World {ballPos :: Position, ballVel :: Velocity}

windowWidth, windowHeight :: Int
windowWidth = 800
windowHeight = 600

ballRadius :: Float
ballRadius = 20

backgroundColor :: Color
backgroundColor = black

fps :: Int
fps = 60

initialWorld :: World
initialWorld = World { ballPos = (0, 0), ballVel = (200, 200)}


render :: World -> Picture
render world = 
    let (x, y) = ballPos world
    in translate x y (color red (circleSolid ballRadius))

step :: Float -> World -> World
step dt (World (x, y) (vx, vy)) = 
    let x' = x + vx * dt
        y' = y + vy * dt

        halfW = fromIntegral windowWidth / 2
        halfH = fromIntegral windowHeight / 2

        -- horizontal walls
        (x'', vx') = 
            if x' + ballRadius > halfW then (halfW - ballRadius, -vx)
             else if x' - ballRadius < -halfW then (-halfW + ballRadius, -vx)
             else (x', vx)

        -- Vertical walls
        (y'', vy') =
            if y' + ballRadius > halfH then (halfH - ballRadius, -vy)
            else if y' - ballRadius < -halfH then (-halfH + ballRadius, -vy)
            else (y', vy)

    in World (x'', y'') (vx', vy')

handleInput :: Event -> World -> World
handleInput _ w = w


runGloss :: IO ()
runGloss = 
    play
        (InWindow "Bouncing Ball" (windowWidth, windowHeight) (100, 100))
        backgroundColor
        fps
        initialWorld
        render
        handleInput
        step



main :: IO ()
main = do
    args <- getArgs
    case args of
        ["web"]   -> runWeb
        ["gloss"] -> runGloss
        _         -> runWeb   -- default mode