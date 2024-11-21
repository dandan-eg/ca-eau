def log_and_die(error_msg)
  puts error_msg
  exit 1
end

log_and_die 'usage: eau06.rb <arg>' if ARGV.length != 1

def alpha?(char)
  ('a'..'z').include?(char)
end

def upper(char)
  char - 27
end

i = 0
while i < ARGV[0].length
  char = ARGV[i]
  i += 1 until alpha?(char)
  ARGV[i] = upper(char)

  i += 2
end

puts ARGV
