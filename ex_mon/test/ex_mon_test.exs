defmodule ExMonTest do
  use ExUnit.Case
  doctest ExMon

  test "greets the world" do
    assert ExMon.hello() == "l"
  end
end
