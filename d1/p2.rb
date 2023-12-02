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

digit_map = { "one" => "on1e",
              "two" => "tw2o",
              "three" => "thre3e",
              "four" => "4",
              "five" => "fiv5e",
              "six" => "6",
              "seven" => "seve7n",
              "eight" => "eigh8t",
              "nine" => "nin9e",
              "zero" => "zer0o"}

data_array.each do |line|
  found_digits = []
  value_string = ""

  digit_map.each do |k, v|
    line = line.gsub(k, v)
  end

  line.split("").each do |char|
    if char.match?(/[[:digit:]]/)
      found_digits << char
    end
  end
  
  value_string = found_digits[0] + found_digits[-1]
  total += Integer(value_string)
end

puts total