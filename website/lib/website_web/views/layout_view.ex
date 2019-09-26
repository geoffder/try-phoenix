defmodule WebsiteWeb.LayoutView do
  use WebsiteWeb, :view

  @doc """
  The functions defined here are available for use in our layout template.
  This is because the .eex template are actually turned into functions inside
  of this module, so title() is simply a local function call to them.
  """
  def title do
    "The Phoenix Rises my brothers!"
  end
end
