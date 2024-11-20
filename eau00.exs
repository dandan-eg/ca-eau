# Combinaisons de 3 chiffres
defmodule Exercise do
  def three_digit_combination do
    for n1 <- 0..9,
        n2 <- (n1 + 1)..9//1,
        n3 <- (n2 + 1)..9//1 do
      IO.puts("#{n1}#{n2}#{n3}")
    end
  end
end

Exercise.three_digit_combination()
