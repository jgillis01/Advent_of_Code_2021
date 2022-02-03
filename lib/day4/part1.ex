defmodule AOC2021.Day4.Part1 do

  alias AOC2021.Util
  alias AOC2021.Day4.Board

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
      |> Enum.min(fn(x,y) ->
        Enum.count(x.guesses) < Enum.count(y.guesses)
      end)
      |> Board.total_score()
  end

end
