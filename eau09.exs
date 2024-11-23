# Entre min et max
defmodule Exercice do
  def verify_args([arg1, arg2]) do
    with {:ok, num1} <- parse_arg(arg1),
         {:ok, num2} <- parse_arg(arg2) do
      if num1 < num2,
        do: {:ok, {num1, num2}},
        else: {:ok, {num2, num1}}
    end
  end

  def verify_args(_args), do: {:error, :bad_args}

  def print_range(cursor, limit) when cursor > limit, do: :ok

  def print_range(cursor, limit) do
    IO.puts(cursor)
    print_range(cursor + 1, limit)
  end

  def parse_arg(arg) do
    case do_parse_arg(arg, 0) do
      :nan -> {:error, {:nan, arg}}
      num -> {:ok, num}
    end
  end

  defp do_parse_arg(<<"+", tail::binary>>, 0) do
    do_parse_arg(tail, 0)
  end

  defp do_parse_arg(<<"-", tail::binary>>, 0) do
    -do_parse_arg(tail, 0)
  end

  defp do_parse_arg(<<>>, accumulator) do
    accumulator
  end

  defp do_parse_arg(<<char, tail::binary>>, accumulator) when char in ?0..?9 do
    do_parse_arg(tail, accumulator * 10 + (char - ?0))
  end

  defp do_parse_arg(<<_char, _tail::binary>>, _accumulator), do: :nan
end

System.argv()
|> Exercice.verify_args()
|> case do
  {:ok, {start, from}} ->
    Exercice.print_range(start, from)

  {:error, {:nan, arg}} ->
    IO.puts("#{arg} is not a number.")

  {:error, :bad_args} ->
    IO.puts("usage: elixir eau09.exs <num1> <num2>")
end
