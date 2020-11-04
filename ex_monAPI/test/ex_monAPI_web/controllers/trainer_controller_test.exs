defmodule ExMonAPIWeb.TrainerControllerTest do
  use ExMonAPIWeb.ConnCase

  alias ExMonAPI.Trainer


  describe "show/2" do
    test "quando o trainer tiver um id, retorne um trainer", %{conn: conn} do
      params = %{name: "Rodrigo", password: "123456"}

      {:ok, %Trainer{id: id}} = ExMonAPI.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Rodrigo"} = response
    end

    test "quando o trainer não tiver um id, retorne um erro", %{conn: conn} do
      params = %{name: "Rodrigo", password: "123456"}

      {:ok, %Trainer{id: _id}} = ExMonAPI.create_trainer(params)

      wrong_id = "12345"

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, wrong_id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Formato inválido de UUID"}
      assert response == expected_response
    end
  end
end
