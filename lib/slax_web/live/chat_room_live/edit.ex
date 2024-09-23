defmodule SlaxWeb.ChatRoomLive.Edit do
  use SlaxWeb, :live_view

  alias Slax.Chat

  def render(assigns) do
    ~H"""
    <div class="mx-auto w-96 mt-12">
      <.header>
        <%= @page_title %>
        <:actions>
          <.link
            class="font-normal text-xs text-blue-600 hover:text-blue-700"
            navigate={~p"/rooms/#{@room}"}
          >
            Back
          </.link>
        </:actions>
      </.header>
      <.simple_form for={@form} id="room-form">
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:topis]} type="text" label="Topic" />
        <:actions>
          <.button phx-disable-with="Saving...." class="w-full">Save</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(%{"room_id" => id}, _session, socket) do
    room = Chat.get_room!(id)

    changeset = Chat.change_room(room)

    socket =
      socket |> assign(page_title: "Edit chat room", room: room) |> assign_form(changeset)

    {:ok, assign(socket, page_title: "Edit chat room", room: room)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
