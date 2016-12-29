defmodule Prime do
  def factorization(n, i \\ 2)
  def factorization(1, _), do: []
  def factorization(n, i) do
    if rem(n, i) == 0 do
      [i] ++ factorization(div(n, i), i)
    else
      factorization(n, i + 1)
    end
  end
end

Prime.factorization(600851475143)
|> IO.inspect
