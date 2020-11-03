defmodule ExMonAPI.TrainerTest do
  use ExMonAPI.DataCase

  alias ExMonAPI.Trainer

  describe "changeset/1" do
    test "se os parâmetros forem válidos, retorne um changeset válido" do
      params = %{name: "Rodrigo", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "Rodrigo",
          password: "123456"
        },
          errors: [],
          data: %ExMonAPI.Trainer{},
          valid?: true
        } = response
    end

    test "se os parâmetros forem inválidos, retorne um changeset inválido" do
      params = %{password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          password: "123456"
        },
          data: %ExMonAPI.Trainer{},
          valid?: false
        } = response
      assert errors_on(response) ==  %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "se os parâmetros forem válidos, retorne uma struct válida" do
      params = %{name: "Rodrigo", password: "123456"}

      response = Trainer.build(params)

      assert {:ok,
      %Trainer{
          id: nil,
          inserted_at: nil,
          name: "Rodrigo",
          password: "123456",
          updated_at: nil
        }
      } = response
    end

    test "se os parâmetros forem inválidos, retorne um chanset inválido" do
      params = %{name: "Rodrigo"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{
                action: :insert,
                changes: %{
                  name: "Rodrigo"
                },
                errors: [
                    password: {"can't be blank", [validation: :required]}
                  ],
                  data: %ExMonAPI.Trainer{},
                  valid?: false
              } = response

      assert errors_on(response) ==  %{password: ["can't be blank"]}
    end
  end

end
