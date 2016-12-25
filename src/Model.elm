module Model exposing (..)

type HttpMethod
  = ANY
  | DELETE
  | GET
  | HEAD
  | OPTION
  | PATCH
  | POST
  | PUT
  | CUSTOM_METHOD String

type HttpProtocol
  = HTTP
  | HTTPS
  | OTHER_PROTOCOL String

type alias Identity =
  { cognitoIdentityPoolId: Maybe String
  , accountId: Maybe String
  , cognitoIdentityId: Maybe String
  , caller: Maybe String
  , apiKey: Maybe String
  , sourceIp: String
  , accessKey: Maybe String
  , cognitoAuthenticationType: Maybe String
  , cognitoAuthenticationProvider: Maybe String
  , userArn: Maybe String
  , userAgent: String
  , user: Maybe String
  }

type alias RequestContext =
  { accountId: String
  , resourceId: String
  , stage: String
  , requestId: String
  -- , identity: Identity
  , resourcePath: String
  -- , httpMethod: HttpMethod
  , apiId: String
  }

type alias RequestEvent body path query =
  { headers: List (String, String)
  , body: List (String, body)
  , path: List (String, path)
  , query: List (String, query)

  -- , method: Maybe HttpMethod
  

  -- , resource: String
  -- , httpMethod: HttpMethod
  -- , queryStringParameters: Maybe String
  -- , pathParameters: Maybe String
  -- , stageVariables: Maybe String
  , requestContext: Maybe RequestContext
  -- , isBase64Encoded: Bool
  }

type alias Context =
  { awsRequestId: String
  , invokeid: String
  , logGroupName: String
  , logStreamName: String
  , functionVersion: String
  , functionName: String
  , memoryLimitInMB: String
  }

type alias Request body path query =
  { event: RequestEvent body path query 
  , context: Context
  }