{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_brickApp (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "brickApp"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "A simple Brick terminal UI exploration"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
