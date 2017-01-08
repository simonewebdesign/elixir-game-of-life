defmodule Table do
  # @top_left "╔"
  # @top_right "╗"
  # @bottom_left "╚"
  # @bottom_right "╝"
  # @horizontal "═" # repeat x3
  # @vertical "║"
  # @union_top "╦"
  # @union_left "╠"
  # @union_right "╣"
  # @union_bottom "╩"

  def print() do
    :ok
  end

  def header(size) do
    "╔═══╦═══╦═══╗"
  end

  def footer(size) do
    "╚═══╩═══╩═══╝"
  end
end
