defmodule WebsiteWeb.ChatController do
  use WebsiteWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
