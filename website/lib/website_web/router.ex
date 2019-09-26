defmodule WebsiteWeb.Router do
  use WebsiteWeb, :router

  pipeline :browser do
    # html is default, but text format can be specified like so:
    # http://localhost:4000/?_format=text
    plug(:accepts, ["html", "text"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", WebsiteWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

    # testing json rendering
    get("/json", PageController, :show)

    get("/hello", HelloController, :index)

    # more json testing
    get("/hello/json", HelloController, :json)

    # Phoenix will take whatever value appears in the URL position after
    # hello/ and pass a Map with the key "messenger" pointing to that value to
    # the controller.
    get("/hello/:messenger", HelloController, :show)

    get("/chat", ChatController, :index)

    # This is a catch-all route that will match against any path that is not
    # explicitly handled in the "/" scope. It will display a not found message
    # for the user (while not redirecting, so they can see their typo'd URL).
    # The variable after the * "not_found" is stored as a key => value pair in
    # the conn.params and conn.path_params maps accesible in the controller.
    # This is however pointless, as the Pheonix server when taken out of debug
    # mode already sends 404s to the ErrorView which is included by default.
    # The debug is just what you see when running on localhost.
    get("/*not_found", NotFoundController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", WebsiteWeb do
  #   pipe_through :api
  # end
end
