defmodule Life.CLI do

  @grid_size 10
  @sleep_interval_ms 300
  @glider [{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}]

  def main([]) do
    loop(MapSet.new([]), @grid_size)
  end
  def main(["glider", "--size=" <> grid_size]) do
    loop(MapSet.new(@glider), String.to_integer(grid_size))
  end
  def main(["glider"]) do
    loop(MapSet.new(@glider), @grid_size)
  end
  def main(["--size=" <> grid_size]) do
    loop(MapSet.new([]), String.to_integer(grid_size))
  end

  defp loop(alive_cells, grid_size, interval \\ @sleep_interval_ms) do
    alive_cells
    |> calc_grid(grid_size)
    |> Table.print()

    :timer.sleep(interval)

    alive_cells
    |> Life.tick()
    |> loop(grid_size)
  end

  # returns a 2d list. true for alive cells, false for dead
  defp calc_grid(alive_cells, size) do
    for i <- 0..(size - 1) do
      for j <- 0..(size - 1) do
        a = for {^j, ^i} <- alive_cells, do: true
        case a do
          [] -> false
          [_] -> true
        end
      end
    end
  end

end
