defmodule ExMonAPI.Trainer.Pokemon.Get do
  alias ExMonAPI.{Trainer.Pokemon, Repo}
  alias Ecto.UUID


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil  -> {:error, "Treinador não encontrado!"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
