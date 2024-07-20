defmodule LiveViewSlaxWeb.ChatRoomLive do
  use LiveViewSlaxWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>Welcome to the chat!</div>
    """
  end
end
