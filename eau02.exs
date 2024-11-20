defmodule Exercice do
  def validate_args(args) do
    if args == [] do
      {:error, :empty}
    else
      {:ok, args}
    end
  end

  def reverse_list(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], accumulator), do: accumulator

  defp do_reverse([head | tail], accumulator) do
    do_reverse(tail, [head | accumulator])
  end

  def print_list([]), do: :ok

  def print_list([head | tail]) do
    IO.puts(head)
    print_list(tail)
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, args} ->
    args
    |> Exercice.reverse_list()
    |> Exercice.print_list()

  {:error, :empty} ->
    IO.puts("Usage: elixir eau02.exs arg1 arg2 [...]")
end
