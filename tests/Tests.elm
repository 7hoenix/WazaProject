module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String

import DashboardTests exposing (dashboardTests)


all : Test
all =
    describe "WazaProject Test Suite"
        [ dashboardTests ]
