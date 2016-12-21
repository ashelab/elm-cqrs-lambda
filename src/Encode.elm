module Encode exposing (..)

-- Have to leave this stub in for now
import Json.Encode as Encode exposing (..)

--

import Model exposing (..)


httpMethodEncoder : HttpMethod -> Encode.Value
httpMethodEncoder method =
  Encode.string <| case method of
    ANY -> "ANY"
    DELETE -> "DELETE"
    GET -> "GET"
    HEAD -> "HEAD"
    OPTION -> "OPTION"
    PATCH -> "PATCH"
    POST -> "POST"
    PUT -> "PUT"
    CUSTOM_METHOD method_ -> method_

httpProtocolEncoder : HttpProtocol -> Encode.Value
httpProtocolEncoder protocol =
  Encode.string <| case protocol of
    HTTP -> "HTTP"
    HTTPS -> "HTTPS"
    OTHER_PROTOCOL protocol_ -> protocol_
