def log_and_die(error_message)
  puts error_message
  exit 1
end

def to_upper(char)
  (char.ord - 32).chr
end

def alpha?(char)
  ('a'.ord..'z'.ord).include? char.ord
end

def white_space?(char)
  [' ', "\t", "\n", "\r"].include?(char)
end

def titlelize(string)
  toggle_upper = true
  out = ''
  string.each_char do |char|
    if toggle_upper && alpha?(char)
      char = to_upper(char)
      toggle_upper = false
    elsif !toggle_upper && white_space?(char)
      toggle_upper = true
    end
    out << char
  end
  out
end

log_and_die 'Usage: ruby <string>' if ARGV.length != 1

puts titlelize(ARGV[0])
