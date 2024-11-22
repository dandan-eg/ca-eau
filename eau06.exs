defmodule Exercice do
  def validate_args([arg]), do: {:ok, arg}
  def validate_args(_args), do: :error

  def upper_two(binaries) do
    do_upper_two(binaries, <<>>, true)
  end

  defp do_upper_two(<<byte, rest::bits>>, accumulator, upper?) when byte in ?a..?z do
    if upper? do
      do_upper_two(rest, <<accumulator::binary, byte - 32>>, false)
    else
      do_upper_two(rest, <<accumulator::binary, byte>>, true)
    end
  end

  defp do_upper_two(<<byte, rest::bits>>, accumulator, upper?) do
    do_upper_two(rest, <<accumulator::binary, byte>>, upper?)
  end

  defp do_upper_two(<<>>, accumulator, _upper?), do: accumulator
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, string} ->
    string
    |> Exercice.upper_two()
    |> IO.puts()

  :error ->
    IO.puts("usage: elixir eau06.exs 'sentence'")
end
