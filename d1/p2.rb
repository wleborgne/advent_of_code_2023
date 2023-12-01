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
digit_strings = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
                  "one", "two", "three", "four", "five", "six", "seven",
                  "eight", "nine", "zero"]
digit_map = { "one" => "on1e",
              "two" => "tw2o",
              "three" => "thre3e",
              "four" => "4",
              "five" => "5",
              "six" => "6",
              "seven" => "7",
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