#!/usr/bin/env ruby


# Open file
input_file = "input.txt"
puts("Reading file #{input_file}")
file = File.open(input_file)

# Read file
data = file.read

# Split contents into an array
data_array = data.split

total = 0

data_array.each do |line|
  found_digits = []
  value_string = ""
  line.split("").each do |char|
    if char.match?(/[[:digit:]]/)
      found_digits << char
    end
  end
  value_string = found_digits[0] + found_digits[-1]
  total += Integer(value_string)
end

puts total