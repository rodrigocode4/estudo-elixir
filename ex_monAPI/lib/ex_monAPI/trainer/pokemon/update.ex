defmodule ExMonAPI.Trainer.Pokemon.Update do
  alias ExMonAPI.{Trainer.Pokemon, Repo}
  alias Ecto.UUID


  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> update(uuid, params)
    end
  end

  defp update(uuid, params) do
    case Repo.get(Pokemon, uuid) do
      nil  -> {:error, "Pokemon não encontrado!"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end
end
