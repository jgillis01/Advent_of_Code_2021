defmodule AOC2021.Day8.Signal do
  defstruct value: 0, data: "", length: 0

  def new(segment) do
    data =
      segment
      |> String.split("")
      |> Enum.reject(&(&1 == ""))

    decode(data, String.length(segment))
  end

  def deduce(segments, %__MODULE__{length: 5} = unknown) do
  end

  def deduce(segments, %__MODULE__{length: 6} = unknown) do

  end

  defp decode(data, 2) do
    %__MODULE__{value: 1, data: data, length: 2}
  end

  defp decode(data, 3) do
    %__MODULE__{value: 7, data: data, length: 3}
  end

  defp decode(data, 4) do
    %__MODULE__{value: 4, data: data, length: 4}
  end

  defp decode(data, 7) do
    %__MODULE__{value: 8, data: data, length: 7}
  end

  defp decode(data, length) do
    %__MODULE__{value: -1, data: data, length: length}
  end

end
