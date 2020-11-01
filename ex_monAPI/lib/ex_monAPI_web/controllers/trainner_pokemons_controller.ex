defmodule ExMonAPIWeb.TrainerPokemonsController do
  use ExMonAPIWeb, :controller
  alias ExMonAPI
  action_fallback ExMonAPIWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonAPI.create_trainer_pokemons()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonAPI.delete_trainer_pokemons()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMonAPI.get_trainer_pokemons()
    |> handle_response(conn, "show.json", :ok)

  end

  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error , _conn, _view, _status), do: error

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

end
