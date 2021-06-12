require './lib/enigma'
require 'date'

enigma = Enigma.new

original_file = File.open(ARGV[0], "r")
message = original_file.read
original_file.close

decrypted_message = enigma.decrypt(message, ARGV[2], ARGV[3])

new_file = File.open(ARGV[1], "w")
new_file.write(decrypted_message[:decryption])
new_file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and the date #{decrypted_message[:date]}"
