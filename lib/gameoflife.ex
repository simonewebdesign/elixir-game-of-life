defmodule Life do
  @moduledoc """
  # The Game of Life: Rules

  ## 1st rule
  Any live cell with fewer than two live neighbours dies, as if caused by under-population.

  ## 2nd rule
  Any live cell with two or three live neighbours lives on to the next generation.

  ## 3rd rule
  Any live cell with more than three live neighbours dies, as if by overcrowding.

  ## 4th rule
  Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  """

  def render_cell do
    IO.write "o"
  end

  def render_multiple_cells(num) when num <= 1 do
    render_cell
  end

  def render_multiple_cells(num) do
    render_cell
    render_multiple_cells(num - 1)
  end

end
