defmodule SpeedrunWeb.Router do
  use SpeedrunWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", SpeedrunWeb do
    pipe_through(:api)

    # criar um author
    post("/authors", AuthorController, :create)
  end
end
