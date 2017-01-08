defmodule TableTest do
  use ExUnit.Case, async: true
  doctest Table

  @size 3
  @table """
  ╔═══╦═══╦═══╗
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╠═══╬═══╬═══╣
  ║   ║   ║   ║
  ╚═══╩═══╩═══╝
  """
  @header "╔═══╦═══╦═══╗"
  @center "║   ║   ║   ║"
  @middle "╠═══╬═══╬═══╣"
  @middl3 "║   ║ █ ║   ║"
  @footer "╚═══╩═══╩═══╝"

  test "header" do
    assert @header == Table.header(@size)
  end

  test "footer" do
    assert @footer == Table.footer(@size)
  end
end
