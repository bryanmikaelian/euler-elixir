1..999
|> Stream.filter(&(rem(&1, 3) == 0 || rem(&1, 5) == 0))
|> Enum.reduce(0, &(&1 + &2))
|> IO.inspect
