defmodule SpeedrunWeb.AuthorController do
  @moduledoc """
  ações relacionadas aos recursos do author
  """
  use SpeedrunWeb, :controller

  alias Speedrun.Authors
  alias Speedrun.Authors.Inputs

  alias SpeedrunWeb.InputValidation

  def create(conn, params) do
    with {:ok, input} <- InputValidation.cast_and_apply(params, Inputs.Create),
         {:ok, author} <- Authors.create_new_author(input) do
      send_json(conn, 200, author)
    else
      {:error, %Ecto.Changeset{}} ->
        msg = %{type: "bad_input", description: "Invalid input"}
        send_json(conn, 400, msg)

      {:error, :email_conflict} ->
        msg = %{type: "conflict", description: "Email já existente"}
        send_json(conn, 412, msg)
    end
  end

  defp send_json(conn, status, body) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(status, Jason.encode!(body))
  end
end
