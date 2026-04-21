{-# LANGUAGE OverloadedStrings #-}

module Main where

import Brick -- the library we are using

-- these are UI components
import Brick.Widgets.Border
import Brick.Widgets.Center
import qualified Graphics.Vty as V -- for keyboard events
import Data.Text (Text) -- text handling

-- App state
-- this is the state of the app, its where the data gets stored
data AppState = AppState
  { count :: Int
  , message :: Text
  }

-- Initial state
-- define an inital state of the app, which is an app state as defined in the type signature 
initialState :: AppState
initialState = AppState
  { count = 0
  , message = "Press 'q' to quit, '+' to increment, '-' to decrement"
  }

-- Draw function - defines what we see
-- this is the function that draws on the screen
-- it takes the current app state, and returns a widget
drawUI :: AppState -> [Widget ()]
drawUI st = [center widget]
  where
    widget = borderWithLabel (str "Counter App") $ 
             vBox
               [ str ("Count: " ++ show (count st))
               , str ""
               , str (show (message st))
               ]

-- Event handler
handleEvent :: BrickEvent () e -> EventM () AppState ()
handleEvent (VtyEvent (V.EvKey V.KEsc [])) = halt -- checking if escape has been pressed, if it has, quit
handleEvent (VtyEvent (V.EvKey (V.KChar 'q') [])) = halt -- quit if q is pressed
handleEvent (VtyEvent (V.EvKey (V.KChar '+') [])) =  -- increment count with modify
  modify $ \st -> st { count = count st + 1 }
handleEvent (VtyEvent (V.EvKey (V.KChar '-') [])) = -- decrement count with modify 
  modify $ \st -> st { count = count st - 1 }
handleEvent _ = return () -- anything else, do nothing

-- App definition
app :: App AppState e ()
app = App
  { appDraw = drawUI
  , appChooseCursor = neverShowCursor
  , appHandleEvent = handleEvent
  , appStartEvent = return ()
  , appAttrMap = const $ attrMap V.defAttr []
  }

main :: IO ()
main = do
  finalState <- defaultMain app initialState
  putStrLn $ "Final count: " ++ show (count finalState)


-- Runs defaultMain which:
--    Starts the app with our config and initial state
--    Loops: display → wait for input → update state → redraw
--    When app exits, prints the final count