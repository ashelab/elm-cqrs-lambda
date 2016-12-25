port module Ports exposing (..)

type alias Response =
  { statusCode: Int
  , body: String
  }

port response :
 Response
 -> Cmd msg
