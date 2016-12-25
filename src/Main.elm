module Main exposing (..)

import Platform exposing (..)

--

import Model exposing (..)
import Decode exposing (..)

--

import Ports

type alias Model = String

type Msg
  = Request String
  
init : Model -> (Model, Cmd Msg)
init data =
  ( data, Ports.response (Ports.Response 200 data ) )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Request data ->
      ( model, Ports.response (Ports.Response 200 data ))

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none

main : Program String Model Msg
main =
    programWithFlags
      { init = init
      , update = update
      , subscriptions = subscriptions
      }
