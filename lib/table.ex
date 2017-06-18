defmodule Table do

  @top_left "╔"
  @top_right "╗"
  @bottom_left "╚"
  @bottom_right "╝"
  @line "═══"
  @pipe "║"
  @union_top "╦"
  @middle_left "╠"
  @middle_right "╣"
  @union_bottom "╩"
  @union_middle "╬"


  @spec print(list(list)) :: :ok
  def print(data) do
    IO.write table(data, Enum.count(data))
  end


  def table(data, size) do
    mid = data
    |> Enum.map(&center(&1, size) <> "\n")
    |> Enum.join(middle(size) <> "\n")

    header(size) <> "\n" <> mid <> footer(size) <> "\n"
  end


  def header(size) do
    @top_left <> do_header("", size)
  end

  defp do_header(str, n) when n <= 1 do
    str <> @line <> @top_right
  end
  defp do_header(str, n) do
    s = str <> @line <> @union_top
    do_header(s, n - 1)
  end


  def footer(size) do
    @bottom_left <> do_footer("", size)
  end

  defp do_footer(str, n) when n <= 1 do
    str <> @line <> @bottom_right
  end
  defp do_footer(str, n) do
    s = str <> @line <> @union_bottom
    do_footer(s, n - 1)
  end


  def center(data, size) do
    @pipe <> do_center(data, "", size)
  end

  defp do_center([h], str, n) when n <= 1 do
    str <> cell(h)
  end
  defp do_center([h|t], str, n) do
    s = str <> cell(h)
    do_center(t, s, n - 1)
  end


  def middle(size) do
    @middle_left <> do_middle("", size)
  end

  defp do_middle(str, n) when n <= 1 do
    str <> @line <> @middle_right
  end
  defp do_middle(str, n) do
    s = str <> @line <> @union_middle
    do_middle(s, n - 1)
  end


  defp cell(true), do: " █ #{@pipe}"
  defp cell(false), do: "   #{@pipe}"
end
