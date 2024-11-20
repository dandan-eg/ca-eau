# combinaison de deux fiffre
def two_digit_combination
  for n1 in 0..99
    for n2 in (n1+1)..99
      puts "#{n1} #{n2},"
    end
  end
end

two_digit_combination()
