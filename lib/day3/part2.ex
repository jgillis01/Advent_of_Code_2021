defmodule AOC2021.Day3.Part2 do

  alias AOC2021.Util

  def run() do
    list =
      Util.read_file("day3_data.txt")
      |> clean_input()

      greater_value =
        process_values(list, 0, true)
        |> String.to_charlist()
        |> List.to_integer(2)

      lesser_value =
        process_values(list, 0, false)
        |> String.to_charlist()
        |> List.to_integer(2)

    greater_value * lesser_value
  end

  def clean_input(data) do
    data
    |> String.split("\n")
  end

  def process_values(list, index, greater) when length(list) > 1 do
    list
    |> group_list(index)
    |> choose_group(greater)
    |> process_values(index + 1, greater)
  end

  def process_values(list,_,_) do
    hd(list)
  end

  def group_list(list, index) do
    list
    |> Enum.group_by(&String.slice(&1,index,1))
  end

  def choose_group(groups, true) do
    case Enum.count(groups["1"]) >= Enum.count(groups["0"]) do
      true ->
        groups["1"]
      _ ->
        groups["0"]
    end
  end

  def choose_group(groups, _) do
    case Enum.count(groups["1"]) >= Enum.count(groups["0"]) do
      true ->
        groups["0"]
      _ ->
        groups["1"]
    end
  end
end
