defmodule LifeTest do
  use ExUnit.Case, async: true
  doctest Life

  test "Life.tick generates the next grid" do
    next_grid =
      [{0, 0}, {1, 0}, {2, 0}, {1, 1}, {-1,-2}]
      |> MapSet.new
      |> Life.tick

    expected =
      [{0, -1}, {0, 0}, {0, 1}, {1, -1}, {1, 0}, {1, 1}, {2, 0}, {2, 1}]
      |> MapSet.new

    assert MapSet.equal?(next_grid, expected)
  end


  test "alive cell with two neighbours lives on to the next generation" do
    alive_cells = [{0, 0}, {1, 0}, {2, 0}] |> MapSet.new
    expected_alive_cell = {1, 0}
    assert Life.tick(alive_cells) |> MapSet.member?(expected_alive_cell)
  end


  test "dead cell with three neighbours becomes a live cell" do
    alive_cells =
      [{0, 0}, {1, 0}, {2, 0}, {1, 1}]
      |> MapSet.new

    born_cells =
      alive_cells
      |> Life.tick

    expected_born_cells =
      [{1, -1}, {0, 1}, {2, 1}]
      |> MapSet.new

    assert born_cells == MapSet.union(alive_cells, expected_born_cells)
  end

end
