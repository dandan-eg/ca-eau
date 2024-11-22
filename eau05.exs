defmodule Exercice do
  def validate_args([arg1, arg2]) do
    if String.length(arg1) > String.length(arg2) do
      {:ok, {arg1, arg2}}
    else
      {:ok, {arg2, arg1}}
    end
  end

  def validate_args(_args), do: :error

  def substring(binary, start, limit) when is_binary(binary) do
    if byte_size(binary) >= limit do
      do_substring(binary, start, limit, <<>>, 0)
    else
      binary
    end
  end

  defp do_substring(<<_::utf8, rest::binary>>, start, limit, acc, index) when index < start do
    do_substring(rest, start, limit, acc, index + 1)
  end

  defp do_substring(<<char::utf8, rest::binary>>, start, limit, acc, index)
       when start <= index and index < limit do
    do_substring(rest, start, limit, <<acc::binary, char>>, index + 1)
  end

  defp do_substring(_binaries, _start, limit, acc, index)
       when index <= limit do
    acc
  end

  def contains?(self, other) do
    limit = byte_size(self)
    size = byte_size(other)

    do_contains?(self, other, size, limit, 0)
  end

  defp do_contains?(_self, _other, size, limit, index) when index + size > limit do
    false
  end

  defp do_contains?(self, other, size, limit, index) do
    sub = substring(self, index, index + size)

    if sub == other do
      true
    else
      do_contains?(self, other, size, limit, index + 1)
    end
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, {bigger, smaller}} ->
    bigger
    |> Exercice.contains?(smaller)
    |> IO.puts()

  :error ->
    IO.puts("usage: elixir eau05.exs <string1> <string2>")
end
