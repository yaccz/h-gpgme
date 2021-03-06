
-- |
-- Module      : Crypto.Gpgme
-- Copyright   : (c) Reto Hablützel 2014
-- License     : MIT
--
-- Maintainer  : rethab@rethab.ch
-- Stability   : experimental
-- Portability : untested
--
-- High Level Binding for GnuPG Made Easy (gpgme)
-- 
-- Most of these functions are a one-to-one translation
-- from GnuPG API with some Haskell idiomatics to make
-- the API more convenient.
--
-- See the GnuPG manual for more information: <https://www.gnupg.org/documentation/manuals/gpgme.pdf>
--
--
-- == Example (from the tests):
--
-- >let alice_pub_fpr = "EAACEB8A"
-- >
-- >-- encrypt
-- >enc <- withCtx "test/bob" "C" openPGP $ \bCtx ->
-- >          withKey bCtx alice_pub_fpr noSecret $ \aPubKey ->
-- >              encrypt bCtx [aPubKey] noFlag plain
-- >
-- >-- decrypt
-- >dec <- withCtx "test/alice" "C" openPGP $ \aCtx ->
-- >        decrypt aCtx (fromJustAndRight enc)
--

module Crypto.Gpgme (
      -- * Context
      Ctx
    , newCtx
    , freeCtx
    , withCtx

    -- currently not exported as it does not work as expected:
    -- , withPWCtx
    
    -- * Keys
    , Key
    , getKey
    , freeKey
    , withKey

    -- * Encryption
    , encrypt
    , encryptSign
    , encrypt'
    , encryptSign'
    , decrypt
    , decrypt'
    , decryptVerify
    , decryptVerify'

      -- * Other Types
    , Fpr
    , Encrypted
    , Plain

    , Protocol(..)

    , InvalidKey

    , IncludeSecret(..)

    , Flag(..)

    , DecryptError(..)

) where


import Crypto.Gpgme.Ctx
import Crypto.Gpgme.Crypto
import Crypto.Gpgme.Types
import Crypto.Gpgme.Key
