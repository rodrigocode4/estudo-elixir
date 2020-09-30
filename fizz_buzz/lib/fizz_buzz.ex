defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_read_file()
  end

  defp handle_read_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_to_number/1)

    {:ok, result}
  end

  defp handle_read_file({:error, reason}), do: {:error, "Erro de leitura do arquivo: #{reason}"}

  defp convert_to_number(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
