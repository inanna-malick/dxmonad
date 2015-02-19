set -e
git clone git://github.com/haskell/cabal.git /home/dev/cabal-install
cd /home/dev/cabal-install
cabal install Cabal/ cabal-install/
