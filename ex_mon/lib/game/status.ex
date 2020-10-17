defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n==== O jogo foi iniciado! ====\n")
    IO.inspect(info)
    IO.puts("**********************************")
  end

  def print_round_message(%{status: :continue} = info) do

    IO.puts("\n==== Ésse é o turno de #{get_player(info)} ====\n")
    IO.inspect(info)
    IO.puts("**********************************")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n==== O jogo acabou!!! ====\n")
    IO.inspect(info)
    IO.puts("**********************************")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n==== Movimento inválido: #{move} ====\n")
  end

  def print_move_messege(:computer, :attack, damage) do
    IO.puts("\n==== O Jogador atacou o computador! #{damage} de dano ====\n")
  end

  def print_move_messege(:player, :attack, damage) do
    IO.puts("\n==== O Computador atacou o jogador ! #{damage} de dano ====\n")
  end

  defp get_player(player) do
    player
    |> Map.get(player[:turn])
    |> Map.get(:name)
  end
end
