defmodule AOC2021.Day4.Part1 do

  alias AOC2021.Util
  alias AOC2021.Day4.Board

  def run() do
    [numbers|data] =
      Util.read_file("day4_data.txt")
      |> String.split("\n")

      boards =
        data
        |> collect_boards()

      numbers
      |> String.trim()
      |> String.split(",")
      |> Enum.reduce(boards, &mark_boards/2)
      |> Enum.min(fn(x,y) ->
        Enum.count(x.guesses) < Enum.count(y.guesses)
      end)
      |> Board.total_score()
  end

  def collect_boards(list) do
    list
    |> Enum.reduce([], &add_row/2)
  end

  def add_row(r, boards) when r == "" do
    [Board.new() | boards]
  end

  def add_row(r, boards) do
    [board | rest] = boards

    [Board.add_numbers(board, r) | rest]
  end

  def mark_boards(number, boards) do
    boards
    |> Enum.map(&Board.mark_number(&1, number))
  end
end
