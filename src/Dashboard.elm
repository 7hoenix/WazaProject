module Dashboard exposing (..)

import Html exposing (Html, Attribute, button, div, input, text, select, option, fieldset, label, h1, form)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String


type alias Skill =
  { skillName : String
  , level : String
  , activity : String
  }


type alias Model = Skill


elixir : Skill
elixir =
  { skillName = "Elixir"
  , level = "Novice"
  , activity = ""
  }

init : (Model, Cmd Msg)
init =
  (elixir, Cmd.none)


type Msg
  = UpdateActivity String
  | UpdateName String
  | UpdateLevel String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    UpdateActivity updatedActivity ->
      ({ model | activity = updatedActivity }, Cmd.none)
    UpdateName updatedName ->
      ({ model | skillName = updatedName }, Cmd.none)
    UpdateLevel updatedLevel ->
      ({ model | level = updatedLevel }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


view : Model -> Html Msg
view model =
  div [ class "dashboard" ]
    [ h1 [ class "dashboard__title" ] [ text "App title" ]
    , Html.form [ class "form" ]
      [ h1 [ class "form__title" ] [ text "Choose your shit" ]
      , div [ class "form__skill-name" ]
        [ select []
          [ option [ value "Elixir" ] [ text "Elixir" ]
          , option [ value "Sketch" ] [ text "Sketch" ]
          ]
        ]
      , div [ class "form__skill-level" ]
        [ fieldset []
          [ radio "Novice" (UpdateLevel "Novice")
          , radio "Intermediate" (UpdateLevel "Intermediate")
          , radio "Advanced" (UpdateLevel "Advanced")
          ]
        ]
      , div [ class "form__skill-activity" ]
        [ input [ placeholder "What activity do you want to do?", onInput UpdateActivity ] []
        ]
      , div [ class "form__submit" ]
        [ button [] [ text "submit" ]
        ]
      ]
    ]

radio : String -> Msg -> Html Msg
radio value msg =
  label
    [ class "form__level"]
    [ input [ type_ "radio", name "level", onClick msg ] []
    , text value
    ]

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
