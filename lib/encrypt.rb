 require './lib/enigma'
 require 'date'

enigma = Enigma.new

original_file = File.open(ARGV[0], "r")
message = original_file.read
original_file.close

encrypted_message = enigma.encrypt(message)

new_file = File.open(ARGV[1], "w")
new_file.write(encrypted_message[:encryption])
new_file.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and the date #{encrypted_message[:date]}"
