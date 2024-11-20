defmodule Exercice do
  def two_digit_combination() do
    for n1 <- 0..99,
        n2 <- n1..99//1 do
      IO.puts("#{n1} #{n2}")
    end
  end
end

Exercice.two_digit_combination()
