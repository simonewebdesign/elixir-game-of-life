defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  # Credits for the ASCII tables: http://www.tablesgenerator.com/text_tables

  @empty_grid_10x10 """
  ╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╚═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╝
  """

  @empty_grid_3x3 """
  ╔═══╦═══╦═══╗
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╚═══╩═══╩═══╝
  """

  @grid_10x10_with_glider """
  ╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
  ║   ║ █ ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║ █ ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║ █ ║ █ ║ █ ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
  ║   ║   ║   ║   ║   ║   ║   ║   ║   ║   ║
  ╚═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╝
  """

  @grid_3x3_with_glider """
  ╔═══╦═══╦═══╗
  ║   ║ █ ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║ █ ║
  ╠═══╬═══╬═══╣
  ║ █ ║ █ ║ █ ║
  ╚═══╩═══╩═══╝
  """

  test "with no args, prints an empty 10x10 grid" do
    assert @empty_grid_10x10 ==
      capture_io(fn ->
        {:ok, pid} = Task.Supervisor.start_link()
        task = Task.Supervisor.async(pid, fn ->
          args = []
          Task.start_link(Life.CLI.main(args))
        end)
        :timer.sleep(1)
        Task.shutdown(task)
      end)
  end

  test "with --size=3 arg, prints an empty 3x3 grid" do
    assert @empty_grid_3x3 ==
      capture_io(fn ->
        {:ok, pid} = Task.Supervisor.start_link()
        task = Task.Supervisor.async(pid, fn ->
          args = ["--size=3"]
          Task.start_link(Life.CLI.main(args))
        end)
        :timer.sleep(1)
        Task.shutdown(task)
      end)
  end

  test "with glider arg, prints a 10x10 with a glider in the top-left corner" do
    assert @grid_10x10_with_glider ==
      capture_io(fn ->
        {:ok, pid} = Task.Supervisor.start_link()
        task = Task.Supervisor.async(pid, fn ->
          args = ["glider"]
          Task.start_link(Life.CLI.main(args))
        end)
        :timer.sleep(1)
        Task.shutdown(task)
      end)
  end

  test "with glider and --size=3 args, prints a 3x3 grid with a glider" do
    assert @grid_3x3_with_glider ==
      capture_io(fn ->
        {:ok, pid} = Task.Supervisor.start_link()
        task = Task.Supervisor.async(pid, fn ->
          args = ["glider", "--size=3"]
          Task.start_link(Life.CLI.main(args))
        end)
        :timer.sleep(1)
        Task.shutdown(task)
      end)
  end

end
