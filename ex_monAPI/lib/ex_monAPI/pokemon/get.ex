defmodule ExMonAPI.Pokemon.Get do
  alias ExMonAPI.PokeApi.Client
  alias ExMonAPI.Pokemon

  def call(name) do
    name
    |> IO.inspect()
    |> Client.get_pokemon()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, Pokemon.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end
