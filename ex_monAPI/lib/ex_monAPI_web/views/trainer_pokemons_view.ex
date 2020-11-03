defmodule ExMonAPIWeb.TrainerPokemonsView do
  use ExMonAPIWeb, :view
  alias ExMonAPI.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
            id: id,
            name: name,
            nickname: nickname,
            types: types,
            trainer_id: trainer_id,
            weight: weight,
            inserted_at: inserted_at
        }
      }) do
    %{
      messege: "Pokemon criado",
      trainer: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{
    pokemon: %Pokemon{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer: %{id: trainer_id, name: trainer_name},
        weight: weight,
        inserted_at: inserted_at
    }
    }) do
      %{
        trainer: %{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer: %{trainer_id: trainer_id, name: trainer_name},
          weight: weight,
          inserted_at: inserted_at
        }
      }
  end

  def render("update.json", %{
    pokemon: %Pokemon{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
        inserted_at: inserted_at
    }
  }) do
%{
  messege: "Pokemon atualizado",
  trainer: %{
    id: id,
    name: name,
    nickname: nickname,
    types: types,
    trainer_id: trainer_id,
    weight: weight,
    inserted_at: inserted_at
  }
}
end

end
