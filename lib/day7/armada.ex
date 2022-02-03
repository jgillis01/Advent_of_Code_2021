defmodule AOC2021.Day7.Armada do

  def fuel_cost(list, number) do
    list
    |> Enum.map(fn(x) -> calculate_fuel2(x, number)  end)
  end

  def calculate_fuel({num, count}, number) do
    {num, abs(num - number) * count}
  end

  def calculate_fuel2(x, number) do
    diff = abs(x - number)
    {x, (diff * (diff + 1))/2}
  end

end
