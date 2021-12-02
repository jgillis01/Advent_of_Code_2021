defmodule AOC2021.Day1 do
  def calculate() do
    read_file()
    |> String.split("\n")
    |> Enum.map(fn x ->
      {val, _} = Integer.parse(x)
      val
    end)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.reduce({0, 0}, &process_reading/2)
  end

  def read_file do
    {:ok, data} = File.read("day1_data.txt")
    data
  end

  def process_reading(value, {last_value, increase_count}) when last_value == 0 do
    {value, increase_count}
  end

  def process_reading(value, {last_value, increase_count}) when value > last_value do
    {value, increase_count + 1}
  end

  def process_reading(value, {_, increase_count}) do
    {value, increase_count}
  end
end
