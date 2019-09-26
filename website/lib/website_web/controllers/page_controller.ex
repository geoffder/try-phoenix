defmodule WebsiteWeb.PageController do
  use WebsiteWeb, :controller

  # This plug will be applied to everything routed to this controller
  # regardless of the action (e.g. :index) it is matched to. Or if we provide
  # `when` after, it will only apply to the given actions.
  plug(
    :assign_welcome_message,
    "Yeet, pointless default welcoming!"
    when action in [:index, :show]
  )

  def index(conn, _params) do
    # put_flash places a message underneath the header of this page.
    # The markup responsible for this is in /templates/layout/app.html.eex
    # clear_flash/1 will remove any flash messages stored in the the session.
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error. (test flash)")
    # |> render("index.html")
    # if index template is specified by atom rather than filename, this can
    # be flexible to render either html or text versions of the page index.
    |> render(:index)
  end

  def show(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]
    render(conn, "show.json", pages: pages)
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
