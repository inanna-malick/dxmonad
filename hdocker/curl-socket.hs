{-# LANGUAGE OverloadedStrings #-}

import Network.Socket
import Network.Socket.ByteString
import Data.ByteString hiding (pack)
import Data.ByteString.Char8
import Network.HTTP.Base
import Network.URI
import System.IO.Streams.Network
import System.IO.Streams.ByteString
import qualified System.IO.Streams as Stream
import Debug.Trace

dockerAddr:: SockAddr
dockerAddr = SockAddrUnix "/var/run/docker.sock"

withDocker:: (Socket -> IO ()) -> IO ()
withDocker f = do
  soc <- socket AF_UNIX Stream 0
  connect soc dockerAddr
  f soc
  sClose soc

dockerRequest:: ByteString
dockerRequest = pack s
  where s = trace ("trace: " ++ (show req) ++ "end trace") (show req)
        req = Request {
            rqURI = uri
            , rqMethod = GET
            , rqHeaders = []
            , rqBody = ""
          }
        uri = URI {
            uriScheme = "unix:"
            , uriAuthority = Nothing
            , uriPath = "/v1.6/events"
            , uriQuery = ""
            , uriFragment = ""

          }

main:: IO ()
main = withDocker $ \s-> do
  (sin, sout) <- socketToStreams s
  req <- fromByteString dockerRequest
  Stream.connect req sout
  Stream.connect sin Stream.stdout

