{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Network.Wai.Middleware.Static (staticPolicy, addBase)

-- This is like a TypeScript interface or a Mongoose schema
data MyData = MyData { info :: String } deriving (Show, Generic)

instance FromJSON MyData
instance ToJSON MyData

main :: IO ()
main = scotty 3000 $ do
    -- This serves your index.html and JS automatically
    middleware $ staticPolicy (addBase "static")

    get "/" $ file "static/index.html"

    post "/submit" $ do
        payload <- jsonData  -- Automatically parses incoming JSON
        json $ MyData { info = "Haskell received: " ++ info payload }