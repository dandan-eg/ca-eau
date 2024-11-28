# Par ordre Ascii
defmodule Exercice do
  def bsort(list, compare_fn) do
    do_bsort(list, compare_fn, [])
  end

  defp do_bsort([head | tail], compare_fn, sorted) do
    {max, remaining} = bubble_up(tail, head, compare_fn, [])
    do_bsort(remaining, compare_fn, [max | sorted])
  end

  defp do_bsort([], _compare_fn, sorted), do: sorted

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

  def compare_ascii(<<char_a::utf8, _::binary>>, <<char_b::utf8, _::binary>>)
      when char_a > char_b,
      do: true

  def compare_ascii(<<char_a::utf8, _::binary>>, <<char_b::utf8, _::binary>>)
      when char_a < char_b,
      do: false

  def compare_ascii(<<_::utf8, rest_a::binary>>, <<_::utf8, rest_b::binary>>) do
    compare_ascii(rest_a, rest_b)
  end

  def run do
    case System.argv() do
      [] ->
        IO.puts("usage elixir eau14.exs [args...]")

      args ->
        args
        |> Exercice.bsort(&Exercice.compare_ascii/2)
        |> IO.inspect()
    end
  end
end

Exercice.run()
