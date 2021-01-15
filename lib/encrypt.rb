require_relative 'enigma'

enigma = Enigma.new
file = File.open("./lib/#{ARGV[0]}", 'r')
encrypt_file = File.open("./lib/#{ARGV[1]}", 'w')
message = file.read.chomp

encrypt= enigma.encrypt(message)
encrypt_file.write(encrypt[:encryption])
puts "Created '#{ARGV[1]}' with the key #{encrypt[:key]} and date #{encrypt[:date]}"
