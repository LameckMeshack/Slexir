defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  import Ecto.Query

  def get_first_room! do
    # q  = from(r in Room, limit: 1, order_by: [asc: :name])
    # Repo.one!(q)
    Repo.one!(from r in Room, limit: 1, order_by: [asc: :name])
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def list_rooms do
    #  Repo.all(from r in Room, order_by: [asc: :name])
    Room |> order_by(asc: :name) |> Repo.all()
  end

  def create_room(attrs) do

    %Room{}
      |> Room.changeset(attrs)
      |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
      |> Room.changeset(attrs)
      |> Repo.update()
  end
end
