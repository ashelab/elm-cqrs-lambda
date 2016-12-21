port module Main exposing (..)

import Json.Encode exposing (Value)
import Test exposing (..)
import Test.Runner.Node exposing (run)

--

import LambdaTests.Tests as LambdaTests

serializationTests : Test
serializationTests =
    describe "elm-cqrs-lambda-tests"
        [ LambdaTests.all
        ]

main : Test.Runner.Node.TestProgram
main =
    run emit serializationTests


port emit : ( String, Value ) -> Cmd msg
