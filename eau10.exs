# Index wanted
defmodule Exercice do
  def find_index(list, target) do
    do_find_index(list, target, 0)
  end

  defp do_find_index([head | _tail], head, index), do: index
  defp do_find_index([], _target, _index), do: -1

  defp do_find_index([_head | tail], target, index) do
    do_find_index(tail, target, index + 1)
  end

  def run do
    case System.argv() do
      [] ->
        IO.puts("usage elixir eau10.exs")

      args ->
        {word_to_find, rest_of_words} = List.pop_at(args, -1)

        index = Exercice.find_index(rest_of_words, word_to_find)
        IO.puts(index)
    end
  end
end

Exercice.run()
