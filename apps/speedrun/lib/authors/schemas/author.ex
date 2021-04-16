defmodule Speedrun.Authors.Schemas.Author do
  @moduledoc """
    O autor do Post.
  """
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "author" do
    field :name, :string
    field :email, :string

    timestamps()
  end
end
