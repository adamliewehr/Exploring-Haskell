{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_randomApp (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "randomApp"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "Monte Carlo estimation using random numbers"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
