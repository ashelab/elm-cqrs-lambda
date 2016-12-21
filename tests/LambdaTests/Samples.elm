module LambdaTests.Samples exposing (..)

import Model exposing (..)

localRequest : String
localRequest = """
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

-- localRequestContext_Expected : Model.RequestContext
-- localRequestContext_Expected =
--   { 
--   }

localRequest_Expected_Headers : Model.RequestHeaders
localRequest_Expected_Headers =
  { host = "localhost:8000"
  , cacheControl = "max-age=0"
  , upgradeInsecureRequests = "1"
  , userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55"
  , accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  , acceptEncoding = "gzip, deflate, sdch, br"
  , acceptLanguage = "en-US,en;q=0.8"

  , connection = "keep-alive"
  , ifNoneMatch = "W/\"55b-ASfti5PTA7Z5wslmxYUDZA\""

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
  }

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

localRequestEvent_Expected : Model.RequestEvent String String String
localRequestEvent_Expected =
  { headers = localRequest_Expected_Headers
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

localContext_Expected : Model.Context
localContext_Expected =
  { awsRequestId = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , invokeid = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , logGroupName = "/aws/lambda/myservice-dev-hello"
  , logStreamName = "2016/12/12/[$LATEST]5555555555a5ae5babb555555a5e55b"
  , functionVersion = "$LATEST"
  , functionName = "myservice-dev-hello"
  , memoryLimitInMB = "1024"
  }


localRequest_Expected : Model.Request String String String
localRequest_Expected =
 { event = localRequestEvent_Expected
 , context = localContext_Expected
 }