# Combinaisons de 3 chiffres
def three_digit_combination
  for n1 in 0..9
    for n2 in (n1 + 1)..9
      for n3 in (n2 + 1)..9
        puts "#{n1}#{n2}#{n3}"
      end
    end
  end
end

three_digit_combination
