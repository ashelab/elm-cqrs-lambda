module LambdaTests.Tests exposing (all)

import Expect
import Test exposing (Test, describe, test)
import Json.Decode exposing (Decoder, decodeString, string, null)

--

import LambdaTests.Dev.SimpleEmptyValidRequest as Dev_SimpleEmptyValidRequest
import LambdaTests.Dev.EmptyValidRequest as Dev_EmptyValidRequest
import LambdaTests.Local.EmptyValidRequest as Local_EmptyValidRequest

import Decode exposing (..)

import Model

--

type alias DecodeTest target =
    { name : String
    , decoder : Decoder target
    , json : String
    , expected : Result String target
    }


decodeTest : DecodeTest target -> Test
decodeTest target =
    describe "should decode json"
        [ test target.name
            <| \() -> (decodeString target.decoder target.json)
            |> Expect.equal target.expected
        ]


run : List (DecodeTest a) -> List Test
run testList =
    List.map decodeTest testList


all : Test
all =
    describe "Serialization Tests" <|
        List.concat
            [ run localRequests
            , run devRequests
            ]


localRequests : List (DecodeTest (Model.Request String String String))
localRequests =
    [ DecodeTest
        "is able to parse a local run serverless sample with an empty payload"
        requestDecoder
        Local_EmptyValidRequest.data
        (Ok Local_EmptyValidRequest.expected)
    ]

devRequests : List (DecodeTest (Model.Request String String String))
devRequests =
    [ DecodeTest
        "is able to parse a dev run serverless sample with a simple empty payload"
        requestDecoder
        Dev_SimpleEmptyValidRequest.data
        (Ok Dev_SimpleEmptyValidRequest.expected)
    , DecodeTest
        "is able to parse a dev run serverless sample with an empty payload"
        requestDecoder
        Dev_EmptyValidRequest.data
        (Ok Dev_EmptyValidRequest.expected)
    ]

-- endpoints : List (DecodeTest Auth.Endpoint)
-- endpoints =
--     [ DecodeTest
--         "is able to parse valid endpoint"
--         Auth.decodeEndpoint
--         Samples.validEndpoint
--         (Ok Stubs.endpoint)
--     , DecodeTest
--         "invalid modified protocol key"
--         Auth.decodeEndpoint
--         """
-- { "protocols": "https:"
-- , "host": "cognito-idp.us-west-2.amazonaws.com"
-- , "port": 443
-- , "hostname": "cognito-idp.us-west-2.amazonaws.com"
-- , "pathname": "/"
-- , "path": "/"
-- , "href": "https://cognito-idp.us-west-2.amazonaws.com/"
-- }
-- """
--         (Err """Expecting an object with a field named `protocol` but instead got: {"protocols":"https:","host":"cognito-idp.us-west-2.amazonaws.com","port":443,"hostname":"cognito-idp.us-west-2.amazonaws.com","pathname":"/","path":"/","href":"https://cognito-idp.us-west-2.amazonaws.com/"}""")
--     ]


-- clients : List (DecodeTest Auth.Client)
-- clients =
--     [ DecodeTest 
--         "is able to parse valid client" 
--         Auth.decodeClient 
--         Samples.validClient 
--         (Ok Stubs.client)
--     ]


-- pools : List (DecodeTest Auth.Pool)
-- pools =
--     [ DecodeTest 
--         "is able to parse valid pool" 
--         Auth.decodePool 
--         Samples.validPool 
--         (Ok Stubs.pool) ]


-- signUpResponses : List (DecodeTest Auth.SignUpResponse)
-- signUpResponses =
--     [ DecodeTest 
--         "parse valid sign up response" 
--         Auth.decodeSignUpResponse 
--         Samples.unconfirmedSignUpSuccess 
--         (Ok Stubs.response)
--     ]
