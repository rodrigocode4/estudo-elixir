defmodule ExMonAPI.Trainer.Get do
  alias ExMonAPI.{Trainer, Repo}
  alias Ecto.UUID


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil  -> {:error, "Treinador não encontrado!"}
      trainer -> {:ok, trainer}
    end
  end
end
