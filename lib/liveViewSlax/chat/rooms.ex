defmodule LiveViewSlax.Chat.Rooms do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :name, :string
    field :topic, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rooms, attrs) do
    rooms
    |> cast(attrs, [:name, :topic])
    |> validate_required([:name, :topic])
  end
end
