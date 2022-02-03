defmodule AOC2021.Day6.Tank do

  def count_fish(num, total_days) when num >= total_days do
    0
  end

  def count_fish(num, total_days) do
    days_left = total_days - (num + 1)

    1 + count_fish(8, days_left) + count_fish(6, days_left)
  end

end
