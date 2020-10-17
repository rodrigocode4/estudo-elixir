defmodule ExMon.Game do
  alias ExMon.Player
  use Agent

  def start(computer, player) do
    initial_state = %{computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> update_game_status(state) end)
  end

  def get_player(player \\ :player), do: Map.get(info(), player)
  def get_turn, do: Map.get(info(), :turn)

  defp update_game_status(
    %{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state
    )
    when player_life == 0 or computer_life == 0,
    do: Map.put(state, :status, :game_over)

  defp update_game_status(state) do
    state
    |> Map.put(:status, :continue)
    |> update_turn()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)

end
