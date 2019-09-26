defmodule WebsiteWeb.NotFoundController do
  use WebsiteWeb, :controller

  def index(conn, _params) do
    IO.puts(inspect(conn.path_params))

    conn
    |> put_status(:not_found)
    |> put_view(WebsiteWeb.ErrorView)
    |> put_layout(false)
    |> render("404.html")
  end
end
