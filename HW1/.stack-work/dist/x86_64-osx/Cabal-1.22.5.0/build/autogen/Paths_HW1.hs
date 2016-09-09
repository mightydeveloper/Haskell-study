module Paths_HW1 (
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

bindir     = "/Users/tonykim/Developer/HaskellPractice/HW1/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/bin"
libdir     = "/Users/tonykim/Developer/HaskellPractice/HW1/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/lib/x86_64-osx-ghc-7.10.3/HW1-0.1.0.0-LJpklevtcg59Xz2eN5sT7f"
datadir    = "/Users/tonykim/Developer/HaskellPractice/HW1/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/share/x86_64-osx-ghc-7.10.3/HW1-0.1.0.0"
libexecdir = "/Users/tonykim/Developer/HaskellPractice/HW1/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/libexec"
sysconfdir = "/Users/tonykim/Developer/HaskellPractice/HW1/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HW1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HW1_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HW1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HW1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HW1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
