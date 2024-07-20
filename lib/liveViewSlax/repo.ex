defmodule LiveViewSlax.Repo do
  use Ecto.Repo,
    otp_app: :liveViewSlax,
    adapter: Ecto.Adapters.Postgres
end
