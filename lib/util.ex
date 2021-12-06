defmodule AOC2021.Util do
  def read_file(file_path) do
    {:ok, data} = File.read(file_path)
    data
  end
end
