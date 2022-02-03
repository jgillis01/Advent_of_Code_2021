defmodule AOC2021.Day6.Part2 do

  alias AOC2021.Util
  alias AOC2021.Day6.Tank

  def run() do
    Util.read_file("day6_data.txt")
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.frequencies()
    |> Map.to_list()
    |> Enum.map(fn({x,y}) -> (Tank.count_fish(x,256) + 1) * y end)
    |> Enum.sum()
  end
end
