defmodule AOC2021.Day2 do
  def read_file do
    {:ok, data} = File.read("day2_data.txt")
    data
  end

  def calculate() do
    movement =
      read_file()
      |> String.split("\n")
      |> Enum.reduce(%{depth: 0, position: 0, aim: 0}, &process_directions/2)

    movement.depth * movement.position
  end

  def process_directions(vector, map) do
    vector
    |> String.split(" ")
    |> update_map(map)
  end

  def update_map(vector_list, %{:depth => depth, :position => position, :aim => aim_val} = map) do
    movement = hd(vector_list)

    {val, _} =
      List.last(vector_list)
      |> Integer.parse()

    case movement do
      "down" ->
        %{map | :aim => aim_val + val}
      "up" ->
        %{map | :aim => aim_val - val}
      "forward" ->
        %{map | :position => position + val, :depth => depth + (aim_val * val)}
    end
  end
end
