defmodule ExMonAPI.Trainer.Delete do
  alias ExMonAPI.{Trainer, Repo}
  alias Ecto.UUID


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_trainer(uuid) do
      nil  -> {:error, "Treinador não encontrado!"}
      trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end
