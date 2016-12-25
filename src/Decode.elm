module Decode exposing (..)

import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)

--

import Model exposing (..)

httpMethodDecoder : String -> HttpMethod
httpMethodDecoder method =
  case method of
    "ANY" -> ANY
    "DELETE" -> DELETE
    "GET" -> GET
    "HEAD" -> HEAD
    "OPTION" -> OPTION
    "PATCH" -> PATCH
    "POST" -> POST
    "PUT" -> PUT
    _ as method_ -> CUSTOM_METHOD method_

httpProtocolDecoder : String -> HttpProtocol
httpProtocolDecoder protocol =
  case protocol of
    "HTTP" -> HTTP
    "HTTPS" -> HTTPS
    _ as protocol_ -> OTHER_PROTOCOL protocol_

requestContextDecoder : Decoder RequestContext
requestContextDecoder =
  decode RequestContext
    |> required "accountId" string
    |> required "resourceId" string
    |> required "stage" string
    |> required "requestId" string
    |> required "resourcePath" string
    -- |> required "httpMethod" httpMethodDecoder
    |> required "apiId" string

nullOr : Decoder a -> Decoder (Maybe a)
nullOr decoder =
    oneOf
      [ null Nothing
      , map Just decoder
      ]

nullableList : Decoder (List a) -> Decoder (List a)
nullableList decoder =
  oneOf
    [ null []
    , decoder
    ]

nullableStringList :  Decoder (List (String, String))
nullableStringList =
  oneOf
    [ null []
    , keyValuePairs string
    ]

-- bodyObjectDecoder = nullOr (keyValuePairs string)

-- bodyNullableDecoder = nullable string

-- bodyDecoder = oneOf
--   [ bodyObjectDecoder
--   , bodyNullableDecoder
--   ]

requestEventDecoder : Decoder (RequestEvent String String String)
requestEventDecoder =
  decode RequestEvent
    |> optional "headers" nullableStringList []
    |> optional "body" nullableStringList []
    |> optional "paths" nullableStringList []
    |> optional "query" nullableStringList []
    |> optional "requestContext" (nullable requestContextDecoder) Nothing

-- decode (RequestEvent string string string)

contextDecoder : Decoder Context
contextDecoder =
  decode Context
    |> required "awsRequestId" string
    |> required "invokeid" string
    |> required "logGroupName" string
    |> required "logStreamName" string
    |> required "functionVersion" string
    |> required "functionName" string
    |> required "memoryLimitInMB" string

requestDecoder : Decoder (Request String String String)
requestDecoder =
  decode Request
    |> required "event" requestEventDecoder
    |> required "context" contextDecoder