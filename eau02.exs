defmodule Exercice do
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

  def run do
    case System.argv() do
      [] ->
        IO.puts("Usage: elixir eau02.exs <arguments>...")

      args ->
        args
        |> Exercice.reverse_list()
        |> Exercice.print_list()
    end
  end
end

Exercice.run()
