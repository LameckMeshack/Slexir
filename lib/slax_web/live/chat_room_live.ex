defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <div>Welcome to the chat!</div>
    </div>
    """
  end
end
