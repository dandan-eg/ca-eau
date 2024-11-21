def log_and_die(error)
  puts error
  exit 1
end

def substring(base, from_idx, to_idx)
  out = ''
  (from_idx..to_idx).each do |index|
    out << base[index]
  end
  out
end

def contains?(base, other)
  window_size = other.length - 1
  limit = (base.length - 1) - window_size

  (0..limit).each do |from_idx|
    to_idx = window_size + from_idx
    return true if substring(base, from_idx, to_idx).eql? other
  end

  false
end

log_and_die 'Usage: eau05.rb arg1 arg2' unless ARGV.length == 2
log_and_die 'the first argument should be longer than the second' unless ARGV[0].length > ARGV[1].length

if contains?(ARGV[0], ARGV[1])
  puts "yes, #{ARGV[1]} is in #{ARGV[0]}"
else
  puts "no, #{ARGV[1]} is not in #{ARGV[0]}"
end
