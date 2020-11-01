defmodule ExMonAPI do
  alias ExMonAPI.{Trainer, Pokemon}
  alias Trainer.Pokemon, as: TrainerPokemon

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate get_pokemon(params), to: Pokemon.Get, as: :call

  defdelegate create_trainer_pokemons(params), to: TrainerPokemon.Create, as: :call
  defdelegate delete_trainer_pokemons(params), to: TrainerPokemon.Delete, as: :call
  defdelegate get_trainer_pokemons(params), to: TrainerPokemon.Get, as: :call
end
