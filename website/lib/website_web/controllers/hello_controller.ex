defmodule WebsiteWeb.HelloController do
  use WebsiteWeb, :controller

  @doc """
  From the guide:
  All controller actions take two arguments. The first is conn, a struct which
  holds a ton of data about the request. The second is params, which are the
  request parameters.
  """
  def index(conn, _params) do
    # tells phoenix to find a template called index.html and render it.
    # It looks for this in a directory named after the controller, so:
    # `lib/website_web/templates/hello`. We also need a `view` for us to
    # render this page, -> `lib/website_web/views/hello_view.ex`
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end

  def json(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]
    render(conn, "show.json", pages: pages)
  end
end
