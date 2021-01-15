require_relative 'enigma'

def generate_number
  rand(10 ** 5).to_s
end

enigma = Enigma.new
file = File.open("./lib/#{ARGV[0]}", 'r')
encrypt_file = File.open("./lib/#{ARGV[1]}", 'w')
message = file.read.chomp

encryption = enigma.encrypt(message, generate_number)
encrypt_file.write(encryption)
puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
