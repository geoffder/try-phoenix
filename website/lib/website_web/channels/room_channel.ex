defmodule WebsiteWeb.RoomChannel do
  use Phoenix.Channel

  @doc """
  Must implement join/3 for authorization. Anyone can join this lobby room,
  but any other ones we'll consider private and requiring special
  authorization. Tools for authorization can be found in `Phoenix.Token`.
  """
  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    # note the string destructuring / pattern match. Pretty cool.
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    # when new_msg event is received from the client, send it out to all
    # subscribers to this channel.
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end
end
