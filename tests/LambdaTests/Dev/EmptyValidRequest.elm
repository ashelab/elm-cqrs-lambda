module LambdaTests.Dev.EmptyValidRequest exposing (..)

import Model exposing (..)

expected_Headers : List (String, String)
expected_Headers =
  [ ("X-Forwarded-Proto", "https")
  , ("X-Forwarded-Port", "443")
  , ("X-Forwarded-For", "96.55.155.55, 54.55.155.55")
  , ("X-Amz-Cf-Id", "b55qS5c5yajcmF5UFnoUHySMIDi-5QyIitqOdpPSY3NBPm_5_G-Hrw==")
  , ("Via", "1.1 5b5555aba555555555d5dcdd55b5555.cloudfront.net (CloudFront)")
  , ("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55")
  , ("Upgrade-Insecure-Requests", "1")
  , ("Host", "5gggggg5gg.execute-api.us-west-2.amazonaws.com")
  , ("CloudFront-Viewer-Country", "US")
  , ("CloudFront-Is-Tablet-Viewer", "false")
  , ("CloudFront-Is-SmartTV-Viewer", "false")
  , ("CloudFront-Is-Mobile-Viewer", "false")
  , ("CloudFront-Is-Desktop-Viewer", "true")
  , ("CloudFront-Forwarded-Proto", "https")
  , ("Cache-Control", "max-age=0")
  , ("Accept-Language", "en-US,en;q=0.8")
  , ("Accept-Encoding", "gzip, deflate, sdch, br")
  , ("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
  ]

-- localRequest_Expected_Identity : Model.Identity
-- localRequest_Expected_Identity =
--   {
--   }

localRequest_Expected_Context : Model.RequestContext
localRequest_Expected_Context =
  { accountId = "55555555555"
  , resourceId = "5cl5cv"
  , stage = "dev"
  , requestId = "f5555a55-c555-55e5-555e-c55bfba55f55"
  -- , identity = localRequest_Expected_Identity
  , resourcePath = "/hello"
  -- , httpMethod = "GET"
  , apiId = "a5hxgmcq5m"
  }

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
  , requestContext = Just localRequest_Expected_Context
  -- , isBase64Encoded = False
  -- , context = localRequest_Expected_Context
  }

expected_Context : Model.Context
expected_Context =
  { awsRequestId = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , invokeid = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , logGroupName = "/aws/lambda/myservice-dev-hello"
  , logStreamName = "2016/12/22/[$LATEST]5d555f5555df5b55bc55d5555fc55db5"
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
{
   "event":{
      "resource":"/hello1",
      "path":"/hello2",
      "httpMethod":"GET",
      "headers":{
         "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
         "Accept-Encoding":"gzip, deflate, sdch, br",
         "Accept-Language":"en-US,en;q=0.8",
         "Cache-Control":"max-age=0",
         "CloudFront-Forwarded-Proto":"https",
         "CloudFront-Is-Desktop-Viewer":"true",
         "CloudFront-Is-Mobile-Viewer":"false",
         "CloudFront-Is-SmartTV-Viewer":"false",
         "CloudFront-Is-Tablet-Viewer":"false",
         "CloudFront-Viewer-Country":"US",
         "Host":"5gggggg5gg.execute-api.us-west-2.amazonaws.com",
         "Upgrade-Insecure-Requests":"1",
         "User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55",
         "Via":"1.1 5b5555aba555555555d5dcdd55b5555.cloudfront.net (CloudFront)",
         "X-Amz-Cf-Id":"b55qS5c5yajcmF5UFnoUHySMIDi-5QyIitqOdpPSY3NBPm_5_G-Hrw==",
         "X-Forwarded-For":"96.55.155.55, 54.55.155.55",
         "X-Forwarded-Port":"443",
         "X-Forwarded-Proto":"https"
      },
      "queryStringParameters":null,
      "pathParameters":null,
      "stageVariables":null,
      "requestContext":{
         "accountId":"55555555555",
         "resourceId":"5cl5cv",
         "stage":"dev",
         "requestId":"f5555a55-c555-55e5-555e-c55bfba55f55",
         "identity":{
            "cognitoIdentityPoolId":null,
            "accountId":null,
            "cognitoIdentityId":null,
            "caller":null,
            "apiKey":null,
            "sourceIp":"96.55.155.55",
            "accessKey":null,
            "cognitoAuthenticationType":null,
            "cognitoAuthenticationProvider":null,
            "userArn":null,
            "userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/555.55 (KHTML, like Gecko) Chrome/55.5.5555.55 Safari/555.55",
            "user":null
         },
         "resourcePath":"/hello",
         "httpMethod":"GET",
         "apiId":"a5hxgmcq5m"
      },
      "body":null,
      "isBase64Encoded":false
   },
   "context":{
      "callbackWaitsForEmptyEventLoop":true,
      "logGroupName":"/aws/lambda/myservice-dev-hello",
      "logStreamName":"2016/12/22/[$LATEST]5d555f5555df5b55bc55d5555fc55db5",
      "functionName":"myservice-dev-hello",
      "memoryLimitInMB":"1024",
      "functionVersion":"$LATEST",
      "invokeid":"55aab5ff-c55b-55e5-a5b5-555cf55e5555",
      "awsRequestId":"55aab5ff-c55b-55e5-a5b5-555cf55e5555",
      "invokedFunctionArn":"arn:aws:lambda:us-west-2:555555555555:function:myservice-dev-hello"
   }
}
"""