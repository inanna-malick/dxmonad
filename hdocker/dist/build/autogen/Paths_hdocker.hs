module Paths_hdocker (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dev/dxmonad/hdocker/.cabal-sandbox/bin"
libdir     = "/home/dev/dxmonad/hdocker/.cabal-sandbox/lib/x86_64-linux-ghc-7.6.3/hdocker-0.1.0.0"
datadir    = "/home/dev/dxmonad/hdocker/.cabal-sandbox/share/x86_64-linux-ghc-7.6.3/hdocker-0.1.0.0"
libexecdir = "/home/dev/dxmonad/hdocker/.cabal-sandbox/libexec"
sysconfdir = "/home/dev/dxmonad/hdocker/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hdocker_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hdocker_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hdocker_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hdocker_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hdocker_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
