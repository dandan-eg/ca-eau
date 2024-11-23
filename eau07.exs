# Majuscule a chaque mot
defmodule Exercice do
  def validate_args([arg]), do: {:ok, arg}
  def validate_args(_args), do: :error

  @spec titleize(binary()) :: binary()
  def titleize(binary) do
    do_titleize(binary, <<>>, true)
  end

  defguard is_whitespace(char) when char in [?\r, ?\n, ?\s]
  defguard is_alpha(char) when char in ?a..?z

  defp do_titleize(<<>>, acc, _upper?), do: acc

  defp do_titleize(<<char, tail::binary>>, acc, _upper?) when is_whitespace(char) do
    do_titleize(tail, <<acc::binary, char>>, true)
  end

  defp do_titleize(<<char, tail::binary>>, acc, upper?) when is_alpha(char) do
    if upper? do
      do_titleize(tail, <<acc::binary, char - 32>>, false)
    else
      do_titleize(tail, <<acc::binary, char>>, true)
    end
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, arg} ->
    arg
    |> Exercice.titleize()
    |> IO.puts()

  :error ->
    IO.puts("usage: elixir eau07.exs <string>")
end
