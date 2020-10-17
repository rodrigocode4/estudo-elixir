defmodule ExMon do
  alias ExMon.{Player, Game}
  alias ExMon.Game.{Status, Actions}

  @computer_name System.get_env("USER")

  def create_player(name, move_avg, move_heal, move_rnd) do
    Player.build(move_avg, move_heal, move_rnd, name)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :heal, :kick)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "Realiza cura"
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())

  end

end
