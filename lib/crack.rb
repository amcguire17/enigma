require './lib/enigma'
require 'date'

enigma = Enigma.new

original_file = File.open(ARGV[0], "r")
message = original_file.read
original_file.close

cracked_message = enigma.crack(message, ARGV[2])

new_file = File.open(ARGV[1], "w")
new_file.write(cracked_message[:decryption])
new_file.close

puts "Created '#{ARGV[1]}' with the key #{cracked_message[:key]} and the date #{cracked_message[:date]}"
