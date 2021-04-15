defmodule SpeedrunWeb.Router do
  use SpeedrunWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpeedrunWeb do
    pipe_through :api
  end
end
