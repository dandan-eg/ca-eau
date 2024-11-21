# Fibonacci
defmodule Exercice do
  @spec validate_args(list(String.t())) ::
          {:ok, integer()}
          | {:error, :bad_args}
          | {:error, {:not_number, String.t()}}

  def validate_args([arg]) do
    case Integer.parse(arg) do
      {number, _rest} ->
        {:ok, number}

      :error ->
        {:error, {:not_number, arg}}
    end
  end

  def validate_args(_list), do: {:error, :bad_args}

  def fib(n) when n < 0, do: -1
  def fib(0), do: 0
  def fib(1), do: 1

  def fib(n) do
    fib(n - 1) + fib(n - 2)
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, number} ->
    number
    |> Exercice.fib()
    |> IO.puts()

  {:error, :bad_args} ->
    IO.puts("Usage: elixir eau03.exs <number>")

  {:error, {:not_number, arg}} ->
    IO.puts("\"#{arg}\" is not a valid number")
end
