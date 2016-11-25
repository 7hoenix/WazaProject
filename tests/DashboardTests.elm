module DashboardTests exposing (dashboardTests)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String

import Dashboard


dashboardTests : Test
dashboardTests =
    describe "The Dashboard"
        [ test "#view" <|
          \() ->
            Expect.equal True True
        ]
