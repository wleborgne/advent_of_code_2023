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
number_regex = /\d+/
line_size = data_array.first.length + 2
line_count = data_array.length

placeholder_line = '.' * line_size
exclusion_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.']

data_array.each_with_index do |line, line_index|
  augmented_line = '.' + line + '.'
  prev_line = line_index == 0 ? placeholder_line : '.' + data_array[line_index - 1] + '.'
  next_line = line_index == line_count - 1 ? placeholder_line : '.' + data_array[line_index + 1] + '.'

  matches = []
  augmented_line.scan(number_regex) do
    matches << Regexp.last_match
  end

  matches.each do |match|
    number = match[0]
    chars_around = ""

    start_index = match.begin(0) - 1
    end_index = start_index + number.size + 1

    chars_around = prev_line[start_index..end_index] + 
                   next_line[start_index..end_index] +
                   augmented_line[start_index] +
                   augmented_line[end_index]

    total += number.to_i unless chars_around.chars.all? { |c| exclusion_chars.include?(c) }
  end
end

puts total