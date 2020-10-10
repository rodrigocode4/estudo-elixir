defmodule ExMonAPI.Trainer.Update do
  alias ExMonAPI.{Trainer, Repo}
  alias Ecto.UUID


  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Formato inválido de UUID"}
      {:ok, uuid} -> update(uuid, params)
    end
  end

  defp update(uuid, params) do
    case fetch_trainer(uuid) do
      nil  -> {:error, "Treinador não encontrado!"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)

  defp update_trainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end
