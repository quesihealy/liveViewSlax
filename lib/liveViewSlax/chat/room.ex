defmodule LiveViewSlax.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveViewSlax.Chat.Message

  schema "rooms" do
    field :name, :string
    field :topic, :string

    has_many :messages, Message

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :topic])
    |> validate_required(:name)
    |> validate_length(:name, max: 80)
    |> validate_format(:name, ~r/\A[a-z0-9-]+\z/,
      message: "Can only contain lowercase letters, numbers and dashes"
    )
    |> validate_length(:topic, max: 200)
    |> unsafe_validate_unique(:name, LiveViewSlax.Repo)
    |> unique_constraint(:name)
  end
end
