defmodule AOC2021.Day8.Part2 do
  alias AOC2021.Day8.Signal
  alias AOC2021.Util

  def run() do
    Util.read_file("day8_data.txt")
    |> clean_input()
    |> Enum.map(&List.first/1)
    |> Enum.map(&process_line/1)
    |> Enum.map(fn(x) -> Enum.group_by(fn(y) -> y.value >= 0 end) end)
  end

  def clean_input(data) do
    data
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " | "))
  end

  def process_line(line) do
    line
    |> String.split(" ")
    |> Enum.map(&Signal.new/1)
  end
end
