port module TemplateModulesBeta exposing (..)

import Api
import ApiRoute
import Browser.Navigation
import Route exposing (Route)
import View
import Json.Decode
import Json.Encode
import Pages.Flags
import Pages.Internal.Platform
import Pages.Manifest as Manifest
import Shared
import Site
import Head
import Html exposing (Html)
import Pages.Internal.NotFoundReason
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Pages.Internal.RoutePattern
import Url
import DataSource exposing (DataSource)
import QueryParams

import Page.Index
import Page.Now
import Page.Projects
import Page.Skills
import Page.Testimonials
import Page.Writing
import Page.Blog.Name_
import Page.Project.Name_
import Page.Skill.Name_
import Page.Tag.Name_
import Page.Testimonial.Name_


type alias Model =
    { global : Shared.Model
    , page : PageModel
    , current :
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : Maybe Route
            , pageUrl : Maybe PageUrl
            }
    }


type PageModel
    = ModelIndex Page.Index.Model
    | ModelNow Page.Now.Model
    | ModelProjects Page.Projects.Model
    | ModelSkills Page.Skills.Model
    | ModelTestimonials Page.Testimonials.Model
    | ModelWriting Page.Writing.Model
    | ModelBlog__Name_ Page.Blog.Name_.Model
    | ModelProject__Name_ Page.Project.Name_.Model
    | ModelSkill__Name_ Page.Skill.Name_.Model
    | ModelTag__Name_ Page.Tag.Name_.Model
    | ModelTestimonial__Name_ Page.Testimonial.Name_.Model

    | NotFound




type Msg
    = MsgGlobal Shared.Msg
    | OnPageChange
        { protocol : Url.Protocol
        , host : String
        , port_ : Maybe Int
        , path : Path
        , query : Maybe String
        , fragment : Maybe String
        , metadata : Maybe Route
        }
    | MsgIndex Page.Index.Msg
    | MsgNow Page.Now.Msg
    | MsgProjects Page.Projects.Msg
    | MsgSkills Page.Skills.Msg
    | MsgTestimonials Page.Testimonials.Msg
    | MsgWriting Page.Writing.Msg
    | MsgBlog__Name_ Page.Blog.Name_.Msg
    | MsgProject__Name_ Page.Project.Name_.Msg
    | MsgSkill__Name_ Page.Skill.Name_.Msg
    | MsgTag__Name_ Page.Tag.Name_.Msg
    | MsgTestimonial__Name_ Page.Testimonial.Name_.Msg



type PageData
    = Data404NotFoundPage____
    | DataIndex Page.Index.Data
    | DataNow Page.Now.Data
    | DataProjects Page.Projects.Data
    | DataSkills Page.Skills.Data
    | DataTestimonials Page.Testimonials.Data
    | DataWriting Page.Writing.Data
    | DataBlog__Name_ Page.Blog.Name_.Data
    | DataProject__Name_ Page.Project.Name_.Data
    | DataSkill__Name_ Page.Skill.Name_.Data
    | DataTag__Name_ Page.Tag.Name_.Data
    | DataTestimonial__Name_ Page.Testimonial.Name_.Data




view :
    { path : Path
    , route : Maybe Route
    }
    -> Maybe PageUrl
    -> Shared.Data
    -> PageData
    ->
        { view : Model -> { title : String, body : Html Msg }
        , head : List Head.Tag
        }
view page maybePageUrl globalData pageData =
    case ( page.route, pageData ) of
        ( Just Route.Index, DataIndex data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelIndex subModel ->
                                  Page.Index.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgIndex
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just Route.Now, DataNow data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelNow subModel ->
                                  Page.Now.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgNow
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just Route.Projects, DataProjects data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelProjects subModel ->
                                  Page.Projects.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgProjects
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just Route.Skills, DataSkills data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelSkills subModel ->
                                  Page.Skills.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgSkills
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just Route.Testimonials, DataTestimonials data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelTestimonials subModel ->
                                  Page.Testimonials.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgTestimonials
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just Route.Writing, DataWriting data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelWriting subModel ->
                                  Page.Writing.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = {}
                                      , path = page.path
                                      }
                                      |> View.map MsgWriting
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just (Route.Blog__Name_ s), DataBlog__Name_ data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelBlog__Name_ subModel ->
                                  Page.Blog.Name_.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = s
                                      , path = page.path
                                      }
                                      |> View.map MsgBlog__Name_
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just (Route.Project__Name_ s), DataProject__Name_ data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelProject__Name_ subModel ->
                                  Page.Project.Name_.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = s
                                      , path = page.path
                                      }
                                      |> View.map MsgProject__Name_
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just (Route.Skill__Name_ s), DataSkill__Name_ data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelSkill__Name_ subModel ->
                                  Page.Skill.Name_.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = s
                                      , path = page.path
                                      }
                                      |> View.map MsgSkill__Name_
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just (Route.Tag__Name_ s), DataTag__Name_ data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelTag__Name_ subModel ->
                                  Page.Tag.Name_.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = s
                                      , path = page.path
                                      }
                                      |> View.map MsgTag__Name_
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }


        ( Just (Route.Testimonial__Name_ s), DataTestimonial__Name_ data ) ->
                  { view =
                      \model ->
                          case model.page of
                              ModelTestimonial__Name_ subModel ->
                                  Page.Testimonial.Name_.page.view
                                      maybePageUrl
                                      model.global
                                      subModel
                                      { data = data
                                      , sharedData = globalData
                                      , routeParams = s
                                      , path = page.path
                                      }
                                      |> View.map MsgTestimonial__Name_
                                      |> Shared.template.view globalData page model.global MsgGlobal

                              _ ->
                                  { title = "Model mismatch", body = Html.text <| "Model mismatch" }
                  , head = []
                  }

        _ ->
            { head = []
            , view =
                \_ ->
                    { title = "Page not found"
                    , body =
                            Html.div [] 
                            [ Html.text "This page could not be found."
                            ]
                    }

            }



init :
    Maybe Shared.Model
    -> Pages.Flags.Flags
    -> Shared.Data
    -> PageData
    -> Maybe Browser.Navigation.Key
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : Maybe Route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init currentGlobalModel userFlags sharedData pageData navigationKey maybePagePath =
    let
        ( sharedModel, globalCmd ) =
            currentGlobalModel |> Maybe.map (\m -> ( m, Cmd.none )) |> Maybe.withDefault (Shared.template.init navigationKey userFlags maybePagePath)

        ( templateModel, templateCmd ) =
            case ( ( Maybe.map2 Tuple.pair (maybePagePath |> Maybe.andThen .metadata) (maybePagePath |> Maybe.map .path) ), pageData ) of
                ( Just ( Route.Index, justPath ), DataIndex thisPageData ) ->
                    Page.Index.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelIndex (Cmd.map MsgIndex)

                ( Just ( Route.Now, justPath ), DataNow thisPageData ) ->
                    Page.Now.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelNow (Cmd.map MsgNow)

                ( Just ( Route.Projects, justPath ), DataProjects thisPageData ) ->
                    Page.Projects.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelProjects (Cmd.map MsgProjects)

                ( Just ( Route.Skills, justPath ), DataSkills thisPageData ) ->
                    Page.Skills.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelSkills (Cmd.map MsgSkills)

                ( Just ( Route.Testimonials, justPath ), DataTestimonials thisPageData ) ->
                    Page.Testimonials.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelTestimonials (Cmd.map MsgTestimonials)

                ( Just ( Route.Writing, justPath ), DataWriting thisPageData ) ->
                    Page.Writing.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = {}
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelWriting (Cmd.map MsgWriting)

                ( Just ( (Route.Blog__Name_ routeParams), justPath ), DataBlog__Name_ thisPageData ) ->
                    Page.Blog.Name_.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = routeParams
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelBlog__Name_ (Cmd.map MsgBlog__Name_)

                ( Just ( (Route.Project__Name_ routeParams), justPath ), DataProject__Name_ thisPageData ) ->
                    Page.Project.Name_.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = routeParams
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelProject__Name_ (Cmd.map MsgProject__Name_)

                ( Just ( (Route.Skill__Name_ routeParams), justPath ), DataSkill__Name_ thisPageData ) ->
                    Page.Skill.Name_.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = routeParams
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelSkill__Name_ (Cmd.map MsgSkill__Name_)

                ( Just ( (Route.Tag__Name_ routeParams), justPath ), DataTag__Name_ thisPageData ) ->
                    Page.Tag.Name_.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = routeParams
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelTag__Name_ (Cmd.map MsgTag__Name_)

                ( Just ( (Route.Testimonial__Name_ routeParams), justPath ), DataTestimonial__Name_ thisPageData ) ->
                    Page.Testimonial.Name_.page.init
                        (Maybe.andThen .pageUrl maybePagePath)
                        sharedModel
                        { data = thisPageData
                        , sharedData = sharedData
                        , routeParams = routeParams
                        , path = justPath.path
                        }
                        |> Tuple.mapBoth ModelTestimonial__Name_ (Cmd.map MsgTestimonial__Name_)

                _ ->
                    ( NotFound, Cmd.none )
    in
    ( { global = sharedModel
      , page = templateModel
      , current = maybePagePath
      }
    , Cmd.batch
        [ templateCmd
        , globalCmd |> Cmd.map MsgGlobal
        ]
    )



update : Shared.Data -> PageData -> Maybe Browser.Navigation.Key -> Msg -> Model -> ( Model, Cmd Msg )
update sharedData pageData navigationKey msg model =
    case msg of
        MsgGlobal msg_ ->
            let
                ( sharedModel, globalCmd ) =
                    Shared.template.update msg_ model.global
            in
            ( { model | global = sharedModel }
            , globalCmd |> Cmd.map MsgGlobal
            )

        OnPageChange record ->
            (init (Just model.global) Pages.Flags.PreRenderFlags sharedData pageData navigationKey <|
                Just
                    { path =
                        { path = record.path
                        , query = record.query
                        , fragment = record.fragment
                        }
                    , metadata = record.metadata
                    , pageUrl =
                        Just
                            { protocol = record.protocol
                            , host = record.host
                            , port_ = record.port_
                            , path = record.path
                            , query = record.query |> Maybe.map QueryParams.fromString
                            , fragment = record.fragment
                            }
                    }
            )
                |> (\( updatedModel, cmd ) ->
                        case Shared.template.onPageChange of
                            Nothing ->
                                ( updatedModel, cmd )

                            Just thingy ->
                                let
                                    ( updatedGlobalModel, globalCmd ) =
                                        Shared.template.update
                                            (thingy
                                                { path = record.path
                                                , query = record.query
                                                , fragment = record.fragment
                                                }
                                            )
                                            model.global
                                in
                                ( { updatedModel
                                    | global = updatedGlobalModel
                                  }
                                , Cmd.batch [ cmd, Cmd.map MsgGlobal globalCmd ]
                                )
                   )


        
        MsgIndex msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelIndex pageModel, DataIndex thisPageData, Just ( Route.Index, pageUrl, justPage ) ) ->
                            Page.Index.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelIndex (Cmd.map MsgIndex)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgNow msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelNow pageModel, DataNow thisPageData, Just ( Route.Now, pageUrl, justPage ) ) ->
                            Page.Now.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelNow (Cmd.map MsgNow)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgProjects msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelProjects pageModel, DataProjects thisPageData, Just ( Route.Projects, pageUrl, justPage ) ) ->
                            Page.Projects.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelProjects (Cmd.map MsgProjects)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgSkills msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelSkills pageModel, DataSkills thisPageData, Just ( Route.Skills, pageUrl, justPage ) ) ->
                            Page.Skills.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelSkills (Cmd.map MsgSkills)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgTestimonials msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelTestimonials pageModel, DataTestimonials thisPageData, Just ( Route.Testimonials, pageUrl, justPage ) ) ->
                            Page.Testimonials.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelTestimonials (Cmd.map MsgTestimonials)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgWriting msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelWriting pageModel, DataWriting thisPageData, Just ( Route.Writing, pageUrl, justPage ) ) ->
                            Page.Writing.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = {}
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelWriting (Cmd.map MsgWriting)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgBlog__Name_ msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelBlog__Name_ pageModel, DataBlog__Name_ thisPageData, Just ( (Route.Blog__Name_ routeParams), pageUrl, justPage ) ) ->
                            Page.Blog.Name_.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = routeParams
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelBlog__Name_ (Cmd.map MsgBlog__Name_)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgProject__Name_ msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelProject__Name_ pageModel, DataProject__Name_ thisPageData, Just ( (Route.Project__Name_ routeParams), pageUrl, justPage ) ) ->
                            Page.Project.Name_.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = routeParams
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelProject__Name_ (Cmd.map MsgProject__Name_)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgSkill__Name_ msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelSkill__Name_ pageModel, DataSkill__Name_ thisPageData, Just ( (Route.Skill__Name_ routeParams), pageUrl, justPage ) ) ->
                            Page.Skill.Name_.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = routeParams
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelSkill__Name_ (Cmd.map MsgSkill__Name_)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgTag__Name_ msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelTag__Name_ pageModel, DataTag__Name_ thisPageData, Just ( (Route.Tag__Name_ routeParams), pageUrl, justPage ) ) ->
                            Page.Tag.Name_.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = routeParams
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelTag__Name_ (Cmd.map MsgTag__Name_)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )

        
        MsgTestimonial__Name_ msg_ ->
            let
                ( updatedPageModel, pageCmd, ( newGlobalModel, newGlobalCmd ) ) =
                    case ( model.page, pageData, Maybe.map3 (\a b c -> ( a, b, c )) (model.current |> Maybe.andThen .metadata) (model.current |> Maybe.andThen .pageUrl) (model.current |> Maybe.map .path) ) of
                        ( ModelTestimonial__Name_ pageModel, DataTestimonial__Name_ thisPageData, Just ( (Route.Testimonial__Name_ routeParams), pageUrl, justPage ) ) ->
                            Page.Testimonial.Name_.page.update
                                pageUrl
                                { data = thisPageData
                                , sharedData = sharedData
                                , routeParams = routeParams
                                , path = justPage.path
                                }
                                navigationKey
                                msg_
                                pageModel
                                model.global
                                |> mapBoth ModelTestimonial__Name_ (Cmd.map MsgTestimonial__Name_)
                                |> (\( a, b, c ) ->
                                        case c of
                                            Just sharedMsg ->
                                                ( a, b, Shared.template.update sharedMsg model.global )

                                            Nothing ->
                                                ( a, b, ( model.global, Cmd.none ) )
                                   )

                        _ ->
                            ( model.page, Cmd.none, ( model.global, Cmd.none ) )
            in
            ( { model | page = updatedPageModel, global = newGlobalModel }
            , Cmd.batch [ pageCmd, newGlobalCmd |> Cmd.map MsgGlobal ]
            )



type alias SiteConfig =
    { canonicalUrl : String
    , manifest : Manifest.Config
    }

templateSubscriptions : Maybe Route -> Path -> Model -> Sub Msg
templateSubscriptions route path model =
    case ( model.page, route ) of
        
        ( ModelIndex templateModel, Just Route.Index ) ->
            Page.Index.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgIndex

        
        ( ModelNow templateModel, Just Route.Now ) ->
            Page.Now.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgNow

        
        ( ModelProjects templateModel, Just Route.Projects ) ->
            Page.Projects.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgProjects

        
        ( ModelSkills templateModel, Just Route.Skills ) ->
            Page.Skills.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgSkills

        
        ( ModelTestimonials templateModel, Just Route.Testimonials ) ->
            Page.Testimonials.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgTestimonials

        
        ( ModelWriting templateModel, Just Route.Writing ) ->
            Page.Writing.page.subscriptions
                Nothing -- TODO wire through value
                {}
                path
                templateModel
                model.global
                |> Sub.map MsgWriting

        
        ( ModelBlog__Name_ templateModel, Just (Route.Blog__Name_ routeParams) ) ->
            Page.Blog.Name_.page.subscriptions
                Nothing -- TODO wire through value
                routeParams
                path
                templateModel
                model.global
                |> Sub.map MsgBlog__Name_

        
        ( ModelProject__Name_ templateModel, Just (Route.Project__Name_ routeParams) ) ->
            Page.Project.Name_.page.subscriptions
                Nothing -- TODO wire through value
                routeParams
                path
                templateModel
                model.global
                |> Sub.map MsgProject__Name_

        
        ( ModelSkill__Name_ templateModel, Just (Route.Skill__Name_ routeParams) ) ->
            Page.Skill.Name_.page.subscriptions
                Nothing -- TODO wire through value
                routeParams
                path
                templateModel
                model.global
                |> Sub.map MsgSkill__Name_

        
        ( ModelTag__Name_ templateModel, Just (Route.Tag__Name_ routeParams) ) ->
            Page.Tag.Name_.page.subscriptions
                Nothing -- TODO wire through value
                routeParams
                path
                templateModel
                model.global
                |> Sub.map MsgTag__Name_

        
        ( ModelTestimonial__Name_ templateModel, Just (Route.Testimonial__Name_ routeParams) ) ->
            Page.Testimonial.Name_.page.subscriptions
                Nothing -- TODO wire through value
                routeParams
                path
                templateModel
                model.global
                |> Sub.map MsgTestimonial__Name_



        _ ->
            Sub.none


main : Pages.Internal.Platform.Program Model Msg PageData Shared.Data
main =
    Pages.Internal.Platform.application
        { init = init Nothing
        , urlToRoute = Route.urlToRoute
        , routeToPath = \route -> route |> Maybe.map Route.routeToPath |> Maybe.withDefault []
        , site = Nothing
        , getStaticRoutes = DataSource.succeed []
        , handleRoute = handleRoute
        , view = view
        , update = update
        , subscriptions =
            \route path model ->
                Sub.batch
                    [ Shared.template.subscriptions path model.global |> Sub.map MsgGlobal
                    , templateSubscriptions route path model
                    ]
        , onPageChange = OnPageChange
        , toJsPort = toJsPort
        , fromJsPort = fromJsPort identity
        , data = dataForRoute
        , sharedData = Shared.template.data
        , apiRoutes = \_ -> []
        , pathPatterns = routePatterns3
        , basePath = [  ]
        }

dataForRoute : Maybe Route -> DataSource PageData
dataForRoute route =
    case route of
        Nothing ->
            DataSource.succeed Data404NotFoundPage____
        Just Route.Index ->
            Page.Index.page.data {} |> DataSource.map DataIndex
        Just Route.Now ->
            Page.Now.page.data {} |> DataSource.map DataNow
        Just Route.Projects ->
            Page.Projects.page.data {} |> DataSource.map DataProjects
        Just Route.Skills ->
            Page.Skills.page.data {} |> DataSource.map DataSkills
        Just Route.Testimonials ->
            Page.Testimonials.page.data {} |> DataSource.map DataTestimonials
        Just Route.Writing ->
            Page.Writing.page.data {} |> DataSource.map DataWriting
        Just (Route.Blog__Name_ routeParams) ->
            Page.Blog.Name_.page.data routeParams |> DataSource.map DataBlog__Name_
        Just (Route.Project__Name_ routeParams) ->
            Page.Project.Name_.page.data routeParams |> DataSource.map DataProject__Name_
        Just (Route.Skill__Name_ routeParams) ->
            Page.Skill.Name_.page.data routeParams |> DataSource.map DataSkill__Name_
        Just (Route.Tag__Name_ routeParams) ->
            Page.Tag.Name_.page.data routeParams |> DataSource.map DataTag__Name_
        Just (Route.Testimonial__Name_ routeParams) ->
            Page.Testimonial.Name_.page.data routeParams |> DataSource.map DataTestimonial__Name_

handleRoute : Maybe Route -> DataSource (Maybe Pages.Internal.NotFoundReason.NotFoundReason)
handleRoute maybeRoute =
    case maybeRoute of
        Nothing ->
            DataSource.succeed Nothing

        Just (Route.Index) ->
            Page.Index.page.handleRoute { moduleName = [ "Index" ], routePattern = { segments = [  ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Now) ->
            Page.Now.page.handleRoute { moduleName = [ "Now" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "now" ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Projects) ->
            Page.Projects.page.handleRoute { moduleName = [ "Projects" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "projects" ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Skills) ->
            Page.Skills.page.handleRoute { moduleName = [ "Skills" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "skills" ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Testimonials) ->
            Page.Testimonials.page.handleRoute { moduleName = [ "Testimonials" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "testimonials" ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Writing) ->
            Page.Writing.page.handleRoute { moduleName = [ "Writing" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "writing" ], ending = Nothing } } (\param -> [  ]) {}
        Just (Route.Blog__Name_ routeParams) ->
            Page.Blog.Name_.page.handleRoute { moduleName = [ "Blog", "Name_" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "blog", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing } } (\param -> [ ( "name", stringToString param.name ) ]) routeParams
        Just (Route.Project__Name_ routeParams) ->
            Page.Project.Name_.page.handleRoute { moduleName = [ "Project", "Name_" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "project", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing } } (\param -> [ ( "name", stringToString param.name ) ]) routeParams
        Just (Route.Skill__Name_ routeParams) ->
            Page.Skill.Name_.page.handleRoute { moduleName = [ "Skill", "Name_" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "skill", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing } } (\param -> [ ( "name", stringToString param.name ) ]) routeParams
        Just (Route.Tag__Name_ routeParams) ->
            Page.Tag.Name_.page.handleRoute { moduleName = [ "Tag", "Name_" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "tag", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing } } (\param -> [ ( "name", stringToString param.name ) ]) routeParams
        Just (Route.Testimonial__Name_ routeParams) ->
            Page.Testimonial.Name_.page.handleRoute { moduleName = [ "Testimonial", "Name_" ], routePattern = { segments = [ Pages.Internal.RoutePattern.StaticSegment "testimonial", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing } } (\param -> [ ( "name", stringToString param.name ) ]) routeParams


stringToString : String -> String
stringToString string =
    "\"" ++ string ++ "\""


nonEmptyToString : ( String, List String ) -> String
nonEmptyToString ( first, rest ) =
    "( "
        ++ stringToString first
        ++ ", [ "
        ++ (rest
                |> List.map stringToString
                |> String.join ", "
           )
        ++ " ] )"


listToString : List String -> String
listToString strings =
    "[ "
        ++ (strings
                |> List.map stringToString
                |> String.join ", "
           )
        ++ " ]"


maybeToString : Maybe String -> String
maybeToString maybeString =
    case maybeString of
        Just string ->
            "Just " ++ stringToString string

        Nothing ->
            "Nothing"




routePatterns : ApiRoute.ApiRoute ApiRoute.Response
routePatterns =
    ApiRoute.succeed
        (Json.Encode.list
            (\{ kind, pathPattern } ->
                Json.Encode.object
                    [ ( "kind", Json.Encode.string kind )
                    , ( "pathPattern", Json.Encode.string pathPattern )
                    ]
            )
            [ { kind = Page.Blog.Name_.page.kind, pathPattern = "/blog/:name" }
            , { kind = Page.Project.Name_.page.kind, pathPattern = "/project/:name" }
            , { kind = Page.Skill.Name_.page.kind, pathPattern = "/skill/:name" }
            , { kind = Page.Tag.Name_.page.kind, pathPattern = "/tag/:name" }
            , { kind = Page.Testimonial.Name_.page.kind, pathPattern = "/testimonial/:name" }
            , { kind = Page.Now.page.kind, pathPattern = "/now" }
            , { kind = Page.Projects.page.kind, pathPattern = "/projects" }
            , { kind = Page.Skills.page.kind, pathPattern = "/skills" }
            , { kind = Page.Testimonials.page.kind, pathPattern = "/testimonials" }
            , { kind = Page.Writing.page.kind, pathPattern = "/writing" }
            , { kind = Page.Index.page.kind, pathPattern = "/" }
          
            ]
            |> (\json -> DataSource.succeed { body = Json.Encode.encode 0 json })
        )
        |> ApiRoute.literal "route-patterns.json"
        |> ApiRoute.single


routePatterns2 : List String
routePatterns2 =
    [ "/blog/:name"
    , "/project/:name"
    , "/skill/:name"
    , "/tag/:name"
    , "/testimonial/:name"
    , "/now"
    , "/projects"
    , "/skills"
    , "/testimonials"
    , "/writing"
    , "/"
    ]


routePatterns3 : List Pages.Internal.RoutePattern.RoutePattern
routePatterns3 =
    [ { segments = [ Pages.Internal.RoutePattern.StaticSegment "blog", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "project", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "skill", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "tag", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "testimonial", Pages.Internal.RoutePattern.DynamicSegment "name" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "now" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "projects" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "skills" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "testimonials" ], ending = Nothing }
    , { segments = [ Pages.Internal.RoutePattern.StaticSegment "writing" ], ending = Nothing }
    , { segments = [  ], ending = Nothing }
    ]

getStaticRoutes : DataSource (List Route)
getStaticRoutes =
    DataSource.combine
        [ Page.Blog.Name_.page.staticRoutes |> DataSource.map (List.map Route.Blog__Name_)
        , Page.Project.Name_.page.staticRoutes |> DataSource.map (List.map Route.Project__Name_)
        , Page.Skill.Name_.page.staticRoutes |> DataSource.map (List.map Route.Skill__Name_)
        , Page.Tag.Name_.page.staticRoutes |> DataSource.map (List.map Route.Tag__Name_)
        , Page.Testimonial.Name_.page.staticRoutes |> DataSource.map (List.map Route.Testimonial__Name_)
        , Page.Now.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Now))
        , Page.Projects.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Projects))
        , Page.Skills.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Skills))
        , Page.Testimonials.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Testimonials))
        , Page.Writing.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Writing))
        , Page.Index.page.staticRoutes |> DataSource.map (List.map (\_ -> Route.Index))
        ]
        |> DataSource.map List.concat


pathsToGenerateHandler : ApiRoute.ApiRoute ApiRoute.Response
pathsToGenerateHandler =
    ApiRoute.succeed
        (DataSource.map2
            (\pageRoutes apiRoutes ->
                { body =
                    (pageRoutes ++ (apiRoutes |> List.map (\api -> "/" ++ api)))
                        |> Json.Encode.list Json.Encode.string
                        |> Json.Encode.encode 0
                }
            )
            (DataSource.map
                (List.map
                    (\route ->
                        route
                            |> Route.toPath
                            |> Path.toAbsolute
                    )
                )
                getStaticRoutes
            )
            ((manifestHandler :: Api.routes getStaticRoutes (\_ -> ""))
                |> List.map ApiRoute.getBuildTimeRoutes
                |> DataSource.combine
                |> DataSource.map List.concat
            )
        )
        |> ApiRoute.literal "all-paths.json"
        |> ApiRoute.single


manifestHandler : ApiRoute.ApiRoute ApiRoute.Response
manifestHandler =
    ApiRoute.succeed
        (Site.config
            |> .data
            |> DataSource.map
                (\data ->
                    Site.config.manifest data
                        |> manifestToFile (Site.config.canonicalUrl)
                )
        )
        |> ApiRoute.literal "manifest.json"
        |> ApiRoute.single


manifestToFile : String -> Manifest.Config -> { body : String }
manifestToFile resolvedCanonicalUrl manifestConfig =
    manifestConfig
        |> Manifest.toJson resolvedCanonicalUrl
        |> (\manifestJsonValue ->
                { body = Json.Encode.encode 0 manifestJsonValue
                }
           )


port toJsPort : Json.Encode.Value -> Cmd msg

port fromJsPort : (Json.Decode.Value -> msg) -> Sub msg


mapBoth : (a -> b) -> (c -> d) -> ( a, c, e ) -> ( b, d, e )
mapBoth fnA fnB ( a, b, c ) =
    ( fnA a, fnB b, c )
