defmodule AOC2021.Day5.Segment do
  defstruct [points: [], start_point: {0,0}, end_point: {0,0}]

  def new(str_data) do
    [start_point, end_point] =
      str_data
      |> String.split(" -> ")
      |> Enum.map(&convert_point/1)

      %__MODULE__{start_point: start_point, end_point: end_point}
  end

  def horizontal_segment?(segment) do
    {_, y1} = segment.start_point
    {_, y2} = segment.end_point

    y1 == y2
  end

  def vertical_segment?(segment) do
    {x1, _} = segment.start_point
    {x2, _} = segment.end_point

    x1 == x2
  end


  def fill_points(segment) do
    points = fill_range(segment.start_point, segment.end_point)

      %__MODULE__{segment | points: points}
  end

  def convert_point(str_point) do
    parts =
      str_point
      |> String.split(",")

      x =
        List.first(parts)
        |> String.to_integer()

      y =
        List.last(parts)
        |> String.to_integer()

      {x, y}
  end

  defp fill_range({x1, y1}, {x2, y2}) when x1 == x2 do
    (y1..y2)
    |> Enum.map(&{x1, &1})
  end

  defp fill_range({x1, y1}, {x2, y2}) when y1 == y2 do
    (x1..x2)
    |> Enum.map(&{&1, y1})
  end

  defp fill_range({x1, y1}, {x2, y2}) do
    [(x1..x2), (y1..y2)]
    |> Enum.zip()
  end
end
