# Par ordre Ascii
defmodule Exercice do
  def bsort(list, compare_fn) do
    do_bsort(list, compare_fn, [])
  end

  def do_bsort([head | tail], compare_fn, sorted) do
    {max, remaining} = bubble_up(tail, head, compare_fn, [])
    do_bsort(remaining, compare_fn, [max | sorted])
  end

  def do_bsort([], _compare_fn, sorted), do: sorted

  defp bubble_up([], max_so_far, _compare_fn, acc) do
    {max_so_far, acc}
  end

  defp bubble_up([head | tail], max_so_far, compare_fn, acc) do
    if compare_fn.(max_so_far, head) do
      bubble_up(tail, max_so_far, compare_fn, [head | acc])
    else
      bubble_up(tail, head, compare_fn, [max_so_far | acc])
    end
  end

  def compare_ascii(_a, <<>>), do: true
  def compare_ascii(<<>>, _b), do: false

  def compare_ascii(<<char::utf8, rest_a::binary>>, <<charb::utf8, rest_b::binary>>) do
    cond do
      char_a == char_b ->
        compare_ascii(rest_a, rest_b)

      char_a > char_b ->
        true

      char_a < char_b ->
        false
    end
  end
end

case System.argv() do
  [] ->
    IO.puts("usage elixir eau14.exs [args...]")

  args ->
    args
    |> Exercice.bsort(&Exercice.compare_ascii/2)
    |> IO.inspect()
end
