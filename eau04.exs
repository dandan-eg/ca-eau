# Prochain nombre premier
defmodule Exercice do
  def validate_args([arg]) do
    case Integer.parse(arg) do
      {number, _rest} ->
        {:ok, number}

      :error ->
        {:error, {:not_number, arg}}
    end
  end

  def validate_args(_args), do: {:error, :bad_args}

  def find_next_prime(from) do
    if prime?(from + 1) do
      from + 1
    else
      find_next_prime(from + 1)
    end
  end

  def prime?(num) when num <= 2, do: false

  def prime?(num) do
    2..round(num / 2)
    |> Enum.all?(fn i ->
      rem(num, i) != 0
    end)
  end
end

System.argv()
|> Exercice.validate_args()
|> case do
  {:ok, number} ->
    number
    |> Exercice.find_next_prime()
    |> IO.puts()

  {:error, {:not_number, arg}} ->
    IO.puts("'#{arg}' is not an number")

  {:error, :bad_args} ->
    IO.puts("usage: eau04.exs <number>")
end
