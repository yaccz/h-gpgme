h-gpgme: High Level Haskell Bindings for GnuPG Made Easy
========================================================

Examples
--------

```haskell
let alice_pub_fpr = "EAACEB8A"

-- encrypt
enc <- withCtx "test/bob" "C" openPGP $ \bCtx ->
         withKey bCtx alice_pub_fpr noSecret $ \aPubKey ->
            encrypt bCtx [aPubKey] noFlag plain

-- decrypt
dec <- withCtx "alice123" "test/alice" "C" openPGP $ \aCtx ->
         decrypt aCtx (fromJustAndRight enc)
```

See the test folder for more examples
