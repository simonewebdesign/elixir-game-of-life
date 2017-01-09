defmodule Life.CLI do

  @grid_size 10
  @sleep_interval_ms 300


  def main([]) do
    "no life"
  end
  def main(["glider"]) do
    [{3, 0}, {4, 1}, {2, 2}, {3, 2}, {4, 2}]
    |> MapSet.new()
    |> loop()
  end


  def loop(alive_cells, interval \\ @sleep_interval_ms) do
    alive_cells
    |> calc_grid()
    |> Table.print()

    :timer.sleep(interval)

    alive_cells
    |> Life.tick()
    |> loop()
  end


  def calc_grid(alive_cells, size \\ @grid_size) do
    for i <- 0..(size - 1) do
      for j <- 0..(size - 1) do
        a = for {^j, ^i} <- alive_cells do
          true
        end
        case a do
          [] -> false
          [_] -> true
        end
      end
    end
  end

end
