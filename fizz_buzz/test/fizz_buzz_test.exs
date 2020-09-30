defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "quando um arquivo válido é lido, retorne uma lista convertida" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz, :buzz]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "quando um arquivo inválido é lido, retorne um erro" do
      expected_response = {:error, "Erro de leitura do arquivo: enoent"}

      assert FizzBuzz.build("invalid.txt") == expected_response
    end
  end
end
