defmodule AOC2021.Day4.Board do
  defstruct [numbers: [], guesses: [], won: false]

  def new() do
    %__MODULE__{}
  end

  def collect(list) do
    list
    |> Enum.reduce([], &add_row/2)
  end

  def mark(number, boards) do
    boards
    |> Enum.map(&mark_number(&1, number))
  end

  def add_numbers(board, string_data) do
    numbers =
      string_data
      |> String.trim()
      |> String.split(~r/\s+/)
      |> Enum.map(fn(x) -> {x, false} end)

    %__MODULE__{board | numbers: [numbers | board.numbers]}
  end

  def total_score(board) do
    last_mark =
      board.guesses
      |> List.first()
      |> String.to_integer()

      last_mark * sum(board)
  end

  defp mark_number(board, number) do
    case board.won do
      true ->
        board
      _ ->
        update_board(board, number)
    end
  end


  defp sum(%__MODULE__{numbers: numbers}) do
    numbers
    |> List.flatten()
    |> Enum.filter(fn({_, marked}) -> !marked end)
    |> Enum.map(fn({num,_}) -> String.to_integer(num) end)
    |> Enum.sum()
  end

  defp row_marked?(board) do
    board.numbers
    |> Enum.map(&Enum.all?(&1, fn({_, marked}) -> marked end))
    |> Enum.any?()
  end

  defp col_marked?(board) do
    numbers =
      board.numbers
      |> List.zip()
      |> Enum.map(&Tuple.to_list/1)

    row_marked?(%__MODULE__{numbers: numbers})
  end

  defp mark_row(row, number) do
    row
    |> Enum.map(fn({num, marked}) ->
      {num, num == number || marked}
    end)
  end

  defp update_board(board, number) do
    numbers =
      board.numbers
      |> Enum.map(&mark_row(&1, number))

    b = %__MODULE__{
      numbers: numbers,
      guesses: [number | board.guesses]
    }

    %__MODULE__{b | won: row_marked?(b) || col_marked?(b)}
  end

  defp add_row(r, boards) when r == "" do
    [new() | boards]
  end

  defp add_row(r, boards) do
    [board | rest] = boards

    [add_numbers(board, r) | rest]
  end

end
