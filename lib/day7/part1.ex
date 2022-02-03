defmodule AOC2021.Day7.Part1 do

  alias AOC2021.Util
  alias AOC2021.Day7.Armada

  def run() do
    Util.read_file("day7_data.txt")
    |> make_list()
    |> calculate()
  end

  def make_list(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&({&1,1}))
  end

  def calculate(list) do
    {max,_} =
      list
      |> Enum.sort(fn({x1,_},{x2,_}) -> x1 >= x2 end)
      |> hd

    list2 = (1..max)

    list
    |> Enum.map(fn({num,_}) ->
      Armada.fuel_cost(list2,num)
    end)
    |> List.flatten()
    |> Enum.group_by(fn({x, _}) -> x end)
    |> Map.to_list()
    |> Enum.map(fn({x, y}) -> {x, sum_list(y)} end)
    |> Enum.sort(fn({_,y1},{_,y2}) -> y1 < y2 end)
    |> hd
  end

  def sum_list(list) do
    list
    |> Enum.reduce(0, fn({_, y}, acc) -> y + acc end)
  end
end
