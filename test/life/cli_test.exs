defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  # credits to this website for the ASCII table: http://www.tablesgenerator.com/text_tables
  @empty_grid """
  ╔═══╦═══╦═══╗
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╚═══╩═══╩═══╝
  """

  @grid_with_glider """
  ╔═══╦═══╦═══╗
  ║   ║ █ ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║ █ ║
  ╠═══╬═══╬═══╣
  ║ █ ║ █ ║ █ ║
  ╚═══╩═══╩═══╝
  """

  test "prints an empty 3x3 grid" do
    assert @empty_grid ==
      capture_io(fn ->
        assert :ok == Life.CLI.main([])
      end)
  end

  test "prints a 3x3 grid with a glider" do
    grid = [{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}]

    assert @grid_with_glider ==
      capture_io(fn ->
        assert :ok == Life.CLI.print(grid)
      end)
  end
end
