defmodule Exercice do
  def ssort(list) do
    do_ssort(list, [])
  end

  defp do_ssort([], acc), do: Enum.reverse(acc)

  defp do_ssort(list, acc) do
    min_index = find_min_index(list)
    {min, remaining} = List.pop_at(list, min_index)

    do_ssort(remaining, [min | acc])
  end

  defp find_min_index([head | tail]) do
    first_index = {head, 0}

    tail
    |> Enum.with_index(1)
    |> Enum.reduce(first_index, fn
      {current_value, _}, {min_value, _} = min when current_value > min_value ->
        min

      current, _min ->
        current
    end)
    |> elem(1)
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
        |> Exercice.ssort()
        |> IO.inspect()

      {:error, {:nan, arg}} ->
        IO.puts("'#{arg}' is not a valid number")

      {:error, :bad_args} ->
        IO.puts("usage: elixir <numbers...> ")
    end
  end
end

Exercice.run()
