defmodule LiveViewSlax.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :topic, :text

      timestamps(type: :utc_datetime)
    end
  end
end
