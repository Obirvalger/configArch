# LiquidHaskell Syntax Highlighting

Provides syntax highlighting for [LiquidHaskell] annotations in Haskell files,
by rendering text inside `{-@ ... @-}` using the plain Haskell highlights (i.e.
not as comments.)

![language-liquidhaskell in action](https://raw.githubusercontent.com/ranjitjhala/language-liquidhaskell/master/screenshot.png)

## Install

This package requires `language-haskell` but unfortunately
there is no way to automatically install it. So do the following:

1. `apm install language-liquidhaskell`
2. `apm install language-haskell`

and that's it.

*NOTE:* It is important that you install the above _in the given order_.

## Copyright

Copyright &copy; 2016 by [Ranjit Jhala](http://ranjitjhala.github.io) 
