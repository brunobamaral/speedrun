defmodule Speedrun.Repo do
  use Ecto.Repo,
    otp_app: :speedrun,
    adapter: Ecto.Adapters.Postgres
end
