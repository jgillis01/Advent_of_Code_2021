defmodule AOC2021.Day4.Part2 do
  alias AOC2021.Day4.Board
  alias AOC2021.Day4.Part1
  alias AOC2021.Util

  def run() do
    [numbers|data] =
      Util.read_file("day4_data.txt")
      |> String.split("\n")

      boards =
        data
        |> Board.collect()

      numbers
      |> String.trim()
      |> String.split(",")
      |> Enum.reduce(boards, &Board.mark/2)
      |> Enum.max(fn(x,y) ->
        Enum.count(x.guesses) > Enum.count(y.guesses)
      end)
      |> Board.total_score()
  end
end
