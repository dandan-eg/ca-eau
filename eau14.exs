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
end

[10, 1, 100, 10_000, 1000]
|> Exercice.bsort(fn a, b ->
  a > b
end)
|> IO.inspect()
