defmodule WebsiteWeb.PageView do
  use WebsiteWeb, :view

  def render("show.json", %{pages: pages}) do
    # pages is a list of maps -> [%{title: "title"}, ...]
    # render_many will call the matching render("page.json") for each element
    %{data: render_many(pages, WebsiteWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
end
