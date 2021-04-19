defmodule Speedrun.Authors do
  @moduledoc """
  domínio público de funções  sobre autores de contexto.
  """

  alias Speedrun.Authors.Schemas.Author
  alias Speedrun.Authors.Inputs
  alias Speedrun.Repo

  require Logger

  @doc """
    entrega changeset para inserir qualquer novo author.
    falha para o index de email unico e transferimos qualquer retorno
    dentro de uma tupla de erro.
  """
  @spec create_new_author(Inputs.Create.t()) :: {:ok, Author.t()} | {:error, term()}
  def create_new_author(%Inputs.Create{} = input) do
    Logger.info("Inserindo um novo autor.")

    params = %{name: input.name, email: input.email}

    with %{valid?: true} = changeset <- Author.changeset(params),
           {:ok, author} <- Repo.insert(changeset) do   
          Logger.info("Autor inserido com sucesso. Email: #{author.email}")
          {:ok, author}
      else
        %{valid?: false } = changeset ->
          Logger.info("Erro ao inserir um novo autor. Error: #{inspect(changeset)}")
          {:error, changeset}
      end
    rescue
      Ecto.ConstraintError ->
        Logger.error("Email já inserido.")
        {:error, :email_conflict}
  end
end
