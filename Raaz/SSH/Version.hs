{-# LANGUAGE OverloadedStrings #-}
module Raaz.SSH.Version
       ( protocol, library, idString, idString'
       ) where

import           Data.Version
import qualified Data.ByteString.Char8 as C8
import           Paths_raaz_ssh        (version)

-- | Version of the ssh protocol supported.
protocol :: Version
protocol = Version [2,0] []


-- | Library version.
library :: Version
library = version


-- | The prefix of the identification string.
idPrefix :: C8.ByteString
idPrefix = C8.concat [ "SSH-" ,    C8.pack $ showVersion protocol
                     , "raazSSH_", C8.pack $ showVersion library
                     ]

-- | The identification string sent by the library.
idString :: C8.ByteString
idString = idPrefix `C8.append` "\r\n"

-- | The identification string with an extra comment field.
idString' :: C8.ByteString -> C8.ByteString
idString' comment = C8.concat [ idPrefix, " ", comment, "\r\n"]
