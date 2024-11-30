# tri a bulle
defmodule Exercice do
  def bsort(list) do
    do_bsort(list, [])
  end

  def do_bsort([head | tail], sorted) do
    {max, remaining} = bubble_up(tail, head, [])
    do_bsort(remaining, [max | sorted])
  end

  def do_bsort([], sorted), do: sorted

  defp bubble_up([], max_so_far, acc) do
    {max_so_far, acc}
  end

  defp bubble_up([head | tail], max_so_far, acc) do
    if head > max_so_far do
      bubble_up(tail, head, [max_so_far | acc])
    else
      bubble_up(tail, max_so_far, [head | acc])
    end
  end

  # Validation

  def verify_args([]), do: {:error, :bad_args}

  def verify_args(args) do
    args
    |> Enum.reduce_while([], fn arg, acc ->
      case Integer.parse(arg) do
        {num, _rest} ->
          {:cont, [num | acc]}

        :error ->
          {:halt, {:error, arg}}
      end
    end)
    |> case do
      {:error, arg} -> {:error, {:nan, arg}}
      numbers when is_list(numbers) -> {:ok, Enum.reverse(numbers)}
    end
  end

  def run do
    System.argv()
    |> Exercice.verify_args()
    |> case do
      {:ok, numbers} ->
        numbers
        |> Exercice.bsort()
        |> IO.inspect()

      {:error, {:nan, arg}} ->
        IO.puts("'#{arg}' is not a valid number")

      {:error, :bad_args} ->
        IO.puts("usage: elixir <numbers...> ")
    end
  end
end
