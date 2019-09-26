defmodule WebsiteWeb.HelloView do
  use WebsiteWeb, :view

  def render("show.json", %{pages: pages}) do
    # pages is a list of maps -> [%{title: "title"}, ...]
    # render_many will call the matching render("page.json") for each element
    %{data: render_many(pages, WebsiteWeb.HelloView, "page.json")}
  end

  def render("page.json", %{hello: page}) do
    # When render_many sends elements from the data it was given, it does so
    # with a key named by the module/directory of the given view. In this case
    # it is :hello. In the PageView, it is :page.
    %{title: page.title}
  end
end
