defmodule ExMonAPI.Trainer.CreateTest do
  use ExMonAPI.DataCase

  alias ExMonAPI.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "quando os parâmetros são válidos, crie um trainer" do
      params = %{name: "Rodrigo", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Rodrigo", password: "123456"}} = response
      assert count_before < count_after
    end

    test "quando os parâmetros são inválidos, retorne um erro" do
      params = %{name: "Rodrigo"}

      {:error, changeset} = Create.call(params)

      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
