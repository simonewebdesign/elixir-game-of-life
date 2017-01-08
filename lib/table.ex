defmodule Table do
  import String, only: [duplicate: 2]

  @top_left "╔"
  @top_right "╗"
  @bottom_left "╚"
  @bottom_right "╝"
  @horizontal "═"
  # @vertical "║"
  @union_top "╦"
  # @union_left "╠"
  # @union_right "╣"
  @union_bottom "╩"

  def print() do
    :ok
  end

  def header(size) do
    @top_left <> do_header("", size)
  end
  def do_header(str, n) when n <= 1 do
    str <> line() <> @top_right
  end
  def do_header(str, n) do
    s = str <> line() <> @union_top
    do_header(s, n - 1)
  end


  def footer(size) do
    @bottom_left <> do_footer("", size)
  end
  def do_footer(str, n) when n <= 1 do
    str <> line() <> @bottom_right
  end
  def do_footer(str, n) do
    s = str <> line() <> @union_bottom
    do_footer(s, n - 1)
  end


  defp line, do: duplicate(@horizontal, 3)
end
