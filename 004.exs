defmodule Palindrome do
  def largest_two_digit_product do
    10..99
    |> Enum.flat_map(&generate_tuples(&1, 10..99))
    |> Enum.map(fn x -> elem(x,0) * elem(x,1) end)
    |> Enum.filter(&palindrome?(&1))
    |> Enum.max
    |> IO.inspect
  end

  def largest_three_digit_product do
    100..999
    |> Enum.flat_map(&generate_tuples(&1, 100..999))
    |> Enum.map(fn x -> elem(x,0) * elem(x,1) end)
    |> Enum.filter(&palindrome?(&1))
    |> Enum.max
    |> IO.inspect
  end

  def palindrome?(num) do
    to_string(num) == String.reverse(to_string(num))
  end

  defp generate_tuples(num, range) do
    range
    |> Enum.map(fn x -> {num, x} end)
  end
end

Palindrome.largest_two_digit_product
Palindrome.largest_three_digit_product
