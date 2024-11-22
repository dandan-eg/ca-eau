defmodule Exercice do
  def validate_args([arg1, arg2]) do
    if String.length(arg1) > String.length(arg2) do
      {:ok, {arg1, arg2}}
    else
      {:ok, {arg2, arg1}}
    end
  end

  def validate_args(_args), do: :error

  def substring(binary, _start, limit) when is_binary(binary) and limit > byte_size(binary), do: binary
  def substring(binary, start, limit) when is_binary(binary) do
    # binary_part(binary, start, limit - start)

    binary
    |> to_charlist()
    |> Enum.with_index()
    |> Enum.reduce_while(<<>>, fn
      {_char, index}, acc when index < start ->
        {:cont, acc}

      {_char, index}, acc when index >= limit ->
        {:halt, acc}

      {char, _index}, acc ->
        {:cont, <<acc::binary, char>>}

    end)
  end

  def contains?(a, b) do
    size = byte_size(a) - byte_size(b)

    0..size
    |> Enum.any?(fn start ->
      limit = start + byte_size(b)
      substring(a, start, limit) == b
    end)
  end
end


System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, {bigger, smaller}} ->
    bigger
    |> Exercice.contains?(smaller)
    |> then(fn 
      true -> IO.puts("Oui '#{smaller}' est contenu dans '#{bigger}'") 
      false -> IO.puts("Non '#{smaller}' n'est pas contenu dans '#{bigger}'") 
    end)

  :error ->
    IO.puts("usage: elixir eau05.exs <string1> <string2>")
end

