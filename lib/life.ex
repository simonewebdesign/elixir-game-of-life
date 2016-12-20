defmodule Life do
  @moduledoc """
  # Conway's Game of Life

  ## Rules

  ### 1st rule
  Any live cell with fewer than two live neighbours dies, as if caused by under-population.

  ### 2nd rule
  Any live cell with two or three live neighbours lives on to the next generation.

  ### 3rd rule
  Any live cell with more than three live neighbours dies, as if by overcrowding.

  ### 4th rule
  Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

  """

  @doc """
  Generates the next grid.
  """
  def tick(grid) do
    calc_next_grid(grid)
  end


  ## PRIVATE


  def calc_next_grid(grid) do
    Enum.reduce(alive_plus_neighbors(grid), MapSet.new, fn({x, y}, grid2) ->
      is_alive = MapSet.member?(grid, {x, y})
      num_neighbors = count_neighbors(grid, {x, y})

      if should_live?(is_alive, num_neighbors) do
        MapSet.put(grid2, {x, y})
      else
        grid2
      end
    end)
  end

  defp alive_plus_neighbors(grid) do
    offsets = [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 0}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]

    Enum.reduce(grid, MapSet.new, fn({x, y}, grid2) ->
      Enum.reduce(offsets, grid2, fn({x_off, y_off}, grid3) ->
        MapSet.put(grid3, {x + x_off, y + y_off})
      end)
    end)
  end

  defp should_live?(is_alive, num_neighbors) do
    (num_neighbors == 2 && is_alive) || (num_neighbors == 3)
  end

  defp count_neighbors(grid, {x, y}) do
    offsets = [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]

    Enum.reduce(offsets, 0, fn({x_off, y_off}, acc) ->
      acc + if MapSet.member?(grid, {x + x_off, y + y_off}), do: 1, else: 0
    end)
  end
end
