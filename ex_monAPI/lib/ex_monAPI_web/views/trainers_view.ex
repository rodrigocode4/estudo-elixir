defmodule ExMonAPIWeb.TrainersView do
  use ExMonAPIWeb, :view
  alias ExMonAPI.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      messege: "Treindor criado",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

end
