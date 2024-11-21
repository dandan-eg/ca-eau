def log_and_die(error_message)
  puts error_message
  exit(1)
end

def reverse_array(arr)
  reversed = Array.new(arr.length)

  length = arr.length - 1
  (0..length).each do |index|
    opposite_index = length - index
    reversed[opposite_index] = arr[index]
  end

  reversed
end

# La gestion d'erreur
log_and_die('Usage: ruby eau02.rb <word> ..') if ARGV.empty?

# L'affichage
puts reverse_array(ARGV)
