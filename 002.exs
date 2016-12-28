# Non-TCO
defmodule Fib do
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(x) do fib(x - 1) + fib(x - 2) end
end

# TCO
defmodule Fib2 do
  def fib(n) do
    fib(n, 1, 0)
  end

  defp fib(0, _, result) do
    result
  end

  defp fib(n, next, result) when next < 4000000 do
    fib(n - 1, next + result, next)
  end

  defp fib(_, _,  _) do
    fib(0)
  end
end

0..200
|> Stream.map(&(Fib2.fib &1))
|> Stream.filter(&(rem(&1, 2) == 0))
|> Enum.reduce(0, &(&1 + &2))
|> IO.inspect
