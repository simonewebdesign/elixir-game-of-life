defmodule LifeTest do
  use ExUnit.Case
  doctest Life

  test "Life.tick generates the next grid" do
    next_grid =
      [{0, 0}, {1, 0}, {2, 0}, {1, 1}, {-1,-2}]
      |> MapSet.new
      |> Life.tick

    expected =
      [{0, -1}, {0, 0}, {0, 1}, {1, -1}, {1, 0}, {1, 1}, {2, 0}, {2, 1}]

    assert MapSet.equal?(next_grid, MapSet.new(expected))
  end
end
