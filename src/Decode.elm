module Decode exposing (..)

-- Have to leave this stub in for now
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


requestHeadersDecoder : Decoder RequestHeaders
requestHeadersDecoder =
  decode RequestHeaders
    |> required "host" string
    |> required "cache-control" string
    |> required "upgrade-insecure-requests" string
    |> required "user-agent" string
    |> required "accept" string
    |> required "accept-encoding" string
    |> required "accept-language" string
    |> required "connection" string
    |> required "if-none-match" string

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

requestEventDecoder : Decoder (RequestEvent String String String)
requestEventDecoder =
  decode RequestEvent
    |> required "headers" requestHeadersDecoder
    |> optional "body" (keyValuePairs string) []
    |> optional "path" (keyValuePairs string) []
    |> optional "query" (keyValuePairs string) []
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