defmodule ExMonAPIWeb.TrainerPokemonController do
  use ExMonAPIWeb, :controller
  alias ExMonAPI
  action_fallback ExMonAPIWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonAPI.create_trainer_pokemons()
    |> handle_response(conn, "create.json", :created)
  end


  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error , _conn, _view, _status), do: error

end
