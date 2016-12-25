module LambdaTests.Dev.SimpleEmptyValidRequest exposing (..)

import Model exposing (..)

expected_Headers : List (String, String)
expected_Headers =
  []

expected_RequestEvent : Model.RequestEvent String String String
expected_RequestEvent =
  { headers = expected_Headers
  , body = []
  , path = []
  , query = []

  , requestContext = Nothing
  }

expected_Context : Model.Context
expected_Context =
  { awsRequestId = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , invokeid = "55aab5ff-c55b-55e5-a5b5-555cf55e5555"
  , logGroupName = "/aws/lambda/myservice-dev-hello"
  , logStreamName = "2016/12/12/[$LATEST]5d555f5555df5b55bc55d5555fc55db5"
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
      "headers":{},
      "body":null,
      "isBase64Encoded":false
   },
   "context":{
      "callbackWaitsForEmptyEventLoop":true,
      "logGroupName":"/aws/lambda/myservice-dev-hello",
      "logStreamName":"2016/12/12/[$LATEST]5d555f5555df5b55bc55d5555fc55db5",
      "functionName":"myservice-dev-hello",
      "memoryLimitInMB":"1024",
      "functionVersion":"$LATEST",
      "invokeid":"55aab5ff-c55b-55e5-a5b5-555cf55e5555",
      "awsRequestId":"55aab5ff-c55b-55e5-a5b5-555cf55e5555",
      "invokedFunctionArn":"arn:aws:lambda:us-west-2:555555555555:function:myservice-dev-hello"
   }
}
"""
