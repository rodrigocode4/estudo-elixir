defmodule ExMonAPI.PokeApi.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias ExMonAPI.PokeApi.Client

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  describe "dget_pokemon/1" do
    test "quando o nome do pokemon tiver o nome, restorne pokemon" do
      body = %{"name" => "pikachu", "weight" => 60, "types" => ["eletric"]}

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")
      expected_response =  {:ok, %{"name" => "pikachu", "types" => ["eletric"], "weight" => 60}}
      assert response == expected_response
    end

    test "quando o nome do pokemon não tiver o nome, restorne error" do

      mock(fn %{method: :get, url: @base_url <> "blabla"} ->
        %Tesla.Env{status: 404}
      end)

      response = Client.get_pokemon("blabla")
      expected_response =  {:error, "Pokemon não encontrado"}
      assert response == expected_response
    end

    test "quando ocorrer um erro inesperado, restorne o error" do

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
       {:error, :timeout}
      end)

      response = Client.get_pokemon("pikachu")
      expected_response =   {:error, :timeout}
      assert response == expected_response
    end
  end
end
