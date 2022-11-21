module Route exposing (Route(..), link, matchers, routeToPath, toLink, urlToRoute, toPath)

{-|

@docs Route, link, matchers, routeToPath, toLink, urlToRoute, toPath

-}


import Html exposing (Attribute, Html)
import Html.Attributes as Attr
import Path exposing (Path)
import Pages.Internal.Router


{-| -}
type Route
    = Blog__Name_ { name : String }
    | Project__Name_ { name : String }
    | Skill__Name_ { name : String }
    | Tag__Name_ { name : String }
    | Testimonial__Name_ { name : String }
    | Now
    | Projects
    | Skills
    | Testimonials
    | Writing
    | Index


{-| -}
urlToRoute : { url | path : String } -> Maybe Route
urlToRoute url =
    url.path
    |> withoutBaseUrl 
    |> Pages.Internal.Router.firstMatch matchers


baseUrl : String
baseUrl =
    "/"


baseUrlAsPath : List String
baseUrlAsPath =
    baseUrl
    |> String.split "/"
    |> List.filter (not << String.isEmpty)


withoutBaseUrl path =
    if (path |> String.startsWith baseUrl) then
      String.dropLeft (String.length baseUrl) path
    else
      path

{-| -}
matchers : List (Pages.Internal.Router.Matcher Route)
matchers =
    [ { pattern = "^\\/blog\\/(?:([^/]+))$"
      , toRoute = \matches ->
      case matches of
          [ Just name ] ->
              Just ( Blog__Name_ { name = name } )
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/project\\/(?:([^/]+))$"
      , toRoute = \matches ->
      case matches of
          [ Just name ] ->
              Just ( Project__Name_ { name = name } )
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/skill\\/(?:([^/]+))$"
      , toRoute = \matches ->
      case matches of
          [ Just name ] ->
              Just ( Skill__Name_ { name = name } )
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/tag\\/(?:([^/]+))$"
      , toRoute = \matches ->
      case matches of
          [ Just name ] ->
              Just ( Tag__Name_ { name = name } )
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/testimonial\\/(?:([^/]+))$"
      , toRoute = \matches ->
      case matches of
          [ Just name ] ->
              Just ( Testimonial__Name_ { name = name } )
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/now$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Now
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/projects$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Projects
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/skills$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Skills
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/testimonials$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Testimonials
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/writing$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Writing
          _ ->
              Nothing

  
     }
    , { pattern = "^\\/$"
      , toRoute = \matches ->
      case matches of
          [  ] ->
              Just Index
          _ ->
              Nothing

  
     }

    ]


{-| -}
routeToPath : Route -> List String
routeToPath route =
    case route of
        Blog__Name_ params ->
           List.concat [ [ "blog" ],[ params.name ] ]
        Project__Name_ params ->
           List.concat [ [ "project" ],[ params.name ] ]
        Skill__Name_ params ->
           List.concat [ [ "skill" ],[ params.name ] ]
        Tag__Name_ params ->
           List.concat [ [ "tag" ],[ params.name ] ]
        Testimonial__Name_ params ->
           List.concat [ [ "testimonial" ],[ params.name ] ]
        Now ->
           List.concat [ [ "now" ] ]
        Projects ->
           List.concat [ [ "projects" ] ]
        Skills ->
           List.concat [ [ "skills" ] ]
        Testimonials ->
           List.concat [ [ "testimonials" ] ]
        Writing ->
           List.concat [ [ "writing" ] ]
        Index ->
           List.concat [  ]

{-| -}
toPath : Route -> Path
toPath route =
    (baseUrlAsPath ++ (route |> routeToPath)) |> String.join "/" |> Path.fromString


{-| -}
toString : Route -> String
toString route =
    route |> toPath |> Path.toAbsolute


{-| -}
toLink : (List (Attribute msg) -> tag) -> Route -> tag
toLink toAnchorTag route =
    toAnchorTag
        [ route |> toString |> Attr.href
        , Attr.attribute "elm-pages:prefetch" ""
        ]


{-| -}
link : Route -> List (Attribute msg) -> List (Html msg) -> Html msg
link route attributes children =
    toLink
        (\anchorAttrs ->
            Html.a
                (anchorAttrs ++ attributes)
                children
        )
        route
