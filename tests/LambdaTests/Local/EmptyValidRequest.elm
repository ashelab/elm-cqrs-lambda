module LambdaTests.Local.EmptyValidRequest exposing (..)

import Model exposing (..)

-- localRequestContext_Expected : Model.RequestContext
-- localRequestContext_Expected =
--   { 
--   }

expected_Headers : List (String, String)
expected_Headers =
  [ ("if-none-match", "W/\"55b-ASfti5PTA7Z5wslmxYUDZA\"")
  , ("connection", "keep-alive")
  , ("accept-language", "en-US,en;q=0.8")
  , ("accept-encoding", "gzip, deflate, sdch, br")
  , ("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
  , ("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55")
  , ("upgrade-insecure-requests", "1")
  , ("cache-control", "max-age=0")
  , ("host", "localhost:8000")
  ]

  -- , cloudFrontForwardedProto = HTTPS
  -- , cloudFrontIsDesktopViewer = False
  -- , cloudFrontIsMobileViewer = False
  -- , cloudFrontIsSmartTVViewer = False
  -- , cloudFrontIsTabletViewer = False
  -- , cloudFrontViewerCountry = ""
  
  -- , via = ""
  -- , xAmzCfId = ""
  -- , xForwardedFor = ""
  -- , xForwardedPort = 0
  -- , xForwardedProto = HTTPS
  -- }

-- localRequest_Expected_Identity : Model.Identity
-- localRequest_Expected_Identity =
--   {
--   }

-- localRequest_Expected_Context : Model.RequestContext
-- localRequest_Expected_Context =
--   { accountId = ""
--   , resourceId = ""
--   , stage = ""
--   , requestId = ""
--   , identity = localRequest_Expected_Identity
--   , resourcePath = ""
--   , httpMethod = GET
--   , apiId = ""
--   }

expected_RequestEvent : Model.RequestEvent String String String
expected_RequestEvent =
  { headers = expected_Headers
  , body = []
  , path = []
  , query = []

  -- , method = Nothing
  -- , query = ""

  -- , resource = ""
  -- , httpMethod = GET
  -- , queryStringParameters = Nothing
  -- , pathParameters = Nothing
  -- , stageVariables = Nothing
  -- -- , requestContext = localRequest_Expected_Context
  , requestContext = Nothing
  -- , isBase64Encoded = False
  -- , context = localRequest_Expected_Context
  }

expected_Context : Model.Context
expected_Context =
  { awsRequestId = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , invokeid = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , logGroupName = "/aws/lambda/myservice-dev-hello"
  , logStreamName = "2016/12/12/[$LATEST]5555555555a5ae5babb555555a5e55b"
  , functionVersion = "$LATEST"
  , functionName = "myservice-dev-hello"
  , memoryLimitInMB = "1024"
  }


expected_Request : Model.Request String String String
expected_Request =
 { event = expected_RequestEvent
 , context = expected_Context
 }

expected : Model.Request String String String
expected = expected_Request

data : String
data = """
{ "event":
  { "method": "GET"
  , "headers":
    { "host": "localhost:8000"
    , "cache-control": "max-age=0"
    , "upgrade-insecure-requests": "1"
    , "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55"
    , "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    , "accept-encoding": "gzip, deflate, sdch, br"
    , "accept-language": "en-US,en;q=0.8"

    , "connection": "keep-alive"
    , "if-none-match":"W/\\\"55b-ASfti5PTA7Z5wslmxYUDZA\\\""
    }
  , "body":
    {
    }
  , "path":
    {
    }
  , "query":
    {
    }
  }
, "context":
  { "awsRequestId": "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , "invokeid": "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , "logGroupName": "/aws/lambda/myservice-dev-hello"
  , "logStreamName": "2016/12/12/[$LATEST]5555555555a5ae5babb555555a5e55b"
  , "functionVersion": "$LATEST"
  , "functionName": "myservice-dev-hello"
  , "memoryLimitInMB": "1024"
  }
}
"""