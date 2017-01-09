defmodule TableTest do
  use ExUnit.Case, async: true
  doctest Table

  @size 3
  @table """
  ╔═══╦═══╦═══╗
  ║   ║ █ ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║ █ ║
  ╠═══╬═══╬═══╣
  ║ █ ║ █ ║ █ ║
  ╚═══╩═══╩═══╝
  """
  @header "╔═══╦═══╦═══╗"
  @center "║   ║   ║   ║"
  @middle "╠═══╬═══╬═══╣"
  @centre "║   ║ █ ║   ║"
  @footer "╚═══╩═══╩═══╝"

  test "header" do
    assert @header == Table.header(@size)
  end

  test "footer" do
    assert @footer == Table.footer(@size)
  end

  test "center" do
    data = [false, false, false]
    assert @center == Table.center(data, @size)
  end

  test "middle" do
    assert @middle == Table.middle(@size)
  end

  test "center with data" do
    data = [false, true, false]
    assert @centre == Table.center(data, @size)
  end

  test "table" do
    data = [[false, true, false],
            [false, false, true],
            [true, true, true]]
    assert @table == Table.table(data, @size)
  end
end
