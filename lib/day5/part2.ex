
defmodule AOC2021.Day5.Part2 do
  alias AOC2021.Util

  alias AOC2021.Day5.Segment

  def run() do
    Util.read_file("day5_data.txt")
    |> String.split("\n")
    |> Enum.map(&Segment.new/1)
    |> Enum.map(&Segment.fill_points/1)
    |> Enum.reduce([], fn(x, acc) -> [x.points | acc] end)
    |> List.flatten()
    |> Enum.frequencies()
    |> Map.to_list()
    |> Enum.filter(fn({_,y}) -> y > 1 end)
    |> Enum.count()
  end
end
