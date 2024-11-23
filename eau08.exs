defmodule Exercice do
  def validate_args([arg]) when bit_size(arg) > 0, do: {:ok, arg}
  def validate_args(_args), do: :error

  def number_only?(<<>>), do: true
  def number_only?(<<char, _tail::binary>>) when char not in ?0..?9, do: false
  def number_only?(<<_number_char, tail::binary>>), do: number_only?(tail)
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, arg} ->
    arg
    |> Exercice.number_only?()
    |> IO.puts()

  :error ->
    IO.puts("usage: elixir eau08.exs")
end
