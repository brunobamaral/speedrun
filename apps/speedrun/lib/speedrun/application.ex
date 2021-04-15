defmodule Speedrun.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Speedrun.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Speedrun.PubSub}
      # Start a worker by calling: Speedrun.Worker.start_link(arg)
      # {Speedrun.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Speedrun.Supervisor)
  end
end
