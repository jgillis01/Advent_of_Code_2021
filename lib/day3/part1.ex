defmodule AOC2021.Day3.Part1 do

  alias AOC2021.Util

  def run() do
    list =
      Util.read_file("day3_data.txt")
      |> clean_input()

    greater_value =
      process_values(list, 0, [], true, true)

    lesser_value =
      process_values(list, 0, [], false, true)

    greater_value * lesser_value
  end

  defp clean_input(data) do
    data
    |> String.split("\n")
  end

  def process_values(list, index, acc, greater, true) do
    val =
      list
      |> group_list(index)
      |> choose_group(greater)

    length =
      list
      |> hd()
      |> String.length()

    process_values(list, index + 1, [val | acc], greater, index + 1 < length)
  end

  def process_values(_, _, acc, _, false) do
    acc
    |> Enum.reverse()
    |> Enum.join()
    |> String.to_charlist()
    |> List.to_integer(2)
  end

  def group_list(list, index) do
    list
    |> Enum.group_by(&String.slice(&1,index,1))
  end

  def choose_group(groups, true) do
    case Enum.count(groups["1"]) >= Enum.count(groups["0"]) do
      true ->
        1
      _ ->
        0
    end
  end

  def choose_group(groups, _) do
    case Enum.count(groups["1"]) >= Enum.count(groups["0"]) do
      true ->
        0
      _ ->
        1
    end
  end
end
