# Prochain nombre premier
def log_and_die(error)
  puts error
  exit(1)
end

def not_prime?(num)
  return true if num <= 2

  i = 2
  while i < num / 2
    return true if num % i == 0

    i += 1
  end
  false
end

VALID_CHARS = %w[0 1 2 3 4 5 6 7 8 9]
def digit?(string)
  return false if string.empty?

  start = if string[0] == '+'
            1
          elsif string[0] == '-'
            1
          else
            0
          end
  limit = string.length - 1
  (start..limit).all? do |index|
    VALID_CHARS.include? string[index]
  end
end

# Gestion d'erreur
log_and_die 'Usage: eau04.rb <prime number>' if ARGV.empty?
arg = ARGV[0]
log_and_die 'Please provide a valid number' unless digit?(arg)

# Parsing
number = Integer(arg)

# Resolution
prime_number = number + 1
while not_prime?(prime_number)
  puts "#{prime_number} not prime.."
  prime_number += 1
end

puts "the next prime is #{prime_number}"
