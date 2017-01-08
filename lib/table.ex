defmodule Table do
  import String, only: [duplicate: 2]

  @top_left "╔"
  @top_right "╗"
  # @bottom_left "╚"
  # @bottom_right "╝"
  @horizontal "═" # repeat x3
  # @vertical "║"
  @union_top "╦"
  # @union_left "╠"
  # @union_right "╣"
  # @union_bottom "╩"

  def print() do
    :ok
  end

  def header(size) do
    @top_left <> do_header("", 3)
  end
  def do_header(str, n) when n <= 1 do
    str <> duplicate(@horizontal, 3) <> @top_right
  end
  def do_header(str, n) do
    s = str <> duplicate(@horizontal, 3) <> @union_top
    do_header(s, n - 1)
  end

  def footer(size) do
    "╚═══╩═══╩═══╝"
  end
end
