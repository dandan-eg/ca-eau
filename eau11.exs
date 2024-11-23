# Différence minimum absolue
defmodule Exercice do
  @spec validate_args(list(String.t())) :: list(integer())
  def validate_args([]), do: {:erorr, :bad_args}
  def validate_args([_arg]), do: {:erorr, :bad_args}

  def validate_args(args) do
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

  def find_min_abs_diff(list) do
    do_find_min_abs_diff(list, nil)
  end

  defp do_find_min_abs_diff([], min_diff), do: min_diff

  defp do_find_min_abs_diff([head | tail], nil) do
    # Calculate differences with the first element
    current_min = find_min_with_tail(head, tail, nil)
    do_find_min_abs_diff(tail, current_min)
  end

  defp do_find_min_abs_diff([head | tail], min_diff) do
    # Calculate differences with the first element
    current_min = find_min_with_tail(head, tail, min_diff)
    do_find_min_abs_diff(tail, current_min)
  end

  defp find_min_with_tail(_value, [], min_diff), do: min_diff

  defp find_min_with_tail(value, [head | tail], nil) do
    diff = abs(value - head)
    find_min_with_tail(value, tail, diff)
  end

  defp find_min_with_tail(value, [head | tail], min_diff) do
    diff = abs(value - head)
    new_min = min(diff, min_diff)
    find_min_with_tail(value, tail, new_min)
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, numbers} ->
    numbers
    |> Exercice.find_min_abs_diff()
    |> IO.puts()

  {:error, {:nan, arg}} ->
    IO.puts("'#{arg}' is not a valid number")

  {:error, :bad_args} ->
    IO.puts("usage: elixir <num1> <num2>")
end

