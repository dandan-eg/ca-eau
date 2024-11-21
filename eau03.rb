# fibonacci
def log_and_die(error)
  puts error
  exit(1)
end

VALID_CHAR = %w[0 1 2 3 4 5 6 7 8 9]
def digit?(str)
  return false if str.empty?

  start_index = if str[0] == '-'
                  1
                elsif str[0] == '+'
                  1
                else
                  0
                end

  len = str.length - 1
  (start_index..len).each do |index|
    return false unless VALID_CHAR.include? str[index]
  end
  true
end

def fibonacci(number)
  return -1 if number.negative?

  accumulator = [0, 1]
  i = 0
  while i < number
    temp = accumulator[0]
    accumulator[0] = accumulator[1]
    accumulator[1] = accumulator[1] + temp
    i += 1
  end

  accumulator[0]
end

log_and_die 'Usage: eau03.rb <number>' if ARGV.length != 1
arg = ARGV[0]
log_and_die "#{arg} is not a valid number" unless digit?(arg)

number = Integer(arg)

puts fibonacci(number)
