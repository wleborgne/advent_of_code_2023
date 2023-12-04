#!/usr/bin/env ruby


# Open file
input_file = "input.txt"
puts("Reading file #{input_file}")
file = File.open(input_file)

# Read file
data = file.read

# Split contents into an array
data_array = data.split("\n")

total = 0

data_array.each do |line|
  res = []
 
  (_card, numbers) = line.split(':')
  (winning_numbers, my_numbers) = numbers.split('|')

  my_numbers.split(' ').each do |number|
    res += winning_numbers.scan(" #{number} ")
  end

  total += 2 ** (res.size - 1) if res.size > 0
end

puts total