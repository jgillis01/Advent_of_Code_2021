defmodule AOC2021.Day8.Display do

  alias AOC2021.Day8.Signal

  def deduce_display(display_map) do
      # 5 ->
        # 3, 2, or 5
        # if contains 1 then 3
        # 5 contains 1 intersect 6 segment
        # 8 without 1 is 6 segment
        # else 2
      # 6 ->
        # 9, 6, or 0
        # 4 and 1 is 9
        # 1 and 7 is 0
        # rest 6

    %{true => known, false => unknown} =
      display_map
      |> Enum.group_by(fn(x) -> x.value >= 0 end)

      unknown
      |> Enum.map(&decode_segment(known, &1))
  end

  def decode_segment(known_segments, %Signal{length: 6} = unknown) do
    # test for 9
    test =
      known_segments
      |> Enum.filter(&(&1.value < 8))
      |> Enum.flat_map(&(&1.data))
      |> Enum.uniq()

    one =
      known_segments
      |> Enum.filter(&(&1.value == 1))
      |> Enum.flat_map(&(&1.data))

      case matches?(test, unknown.data) do
        true ->
          %Signal{unknown | value: 9}
        false ->
          case matches?(one, unknown.data) do
            true ->
              %Signal{unknown | value: 0}
            false ->
              %Signal{unknown | value: 6}
          end
      end
  end

  def decode_segment(known_segments, %Signal{length: 5} = unknown) do

  end

  def matches?(data1, data2) do
    data1
    |> Enum.map(fn(x) -> Enum.any?(data2, fn(y) -> x == y end) end)
    |> Enum.all?()
  end
end
