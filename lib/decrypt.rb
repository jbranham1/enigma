require_relative 'enigma'

enigma = Enigma.new
file = File.open("./lib/#{ARGV[0]}", 'r')
decrypt_file = File.open("./lib/#{ARGV[1]}", 'w')
message = file.read.chomp

decrypt = enigma.decrypt(message, ARGV[2], ARGV[3])
encrypt_file.write(decrypt[:encryption])
puts "Created '#{ARGV[1]}' with the key #{decrypt[:key]} and date #{decrypt[:date]}"
