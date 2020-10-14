defmodule ExMonAPIWeb.PokemonsController do
  use ExMonAPIWeb, :controller
  alias ExMonAPI

  action_fallback ExMonAPIWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> IO.inspect()
    |> ExMonAPI.get_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)

  end
  defp handle_response({:error, _reason} = error, _conn), do: error
end
