defmodule ExMonAPI.Trainer.Pokemon.Delete do
  alias ExMonAPI.{Trainer.Pokemon, Repo}
  alias Ecto.UUID


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil  -> {:error, "Pokemon não encontrado!"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
