defmodule SpeedrunWeb.InputValidation do
  @moduledoc """
    valida parametros de mapa para schema
  """

  def cast_and_apply(params, module) do
    case module.changeset(params) do
      %{valid?: true} = changeset ->
        {:ok, Ecto.Changeset.apply_changes(changeset)}

      %{valid?: false} = changeset ->
        {:error, changeset}
    end
  end
end
