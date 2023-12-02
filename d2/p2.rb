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
  # split off selection list
  selections = line.split(':')[1]
  # initialize holder of color counts
  cube_map = { "red" => 0, "green" => 0, "blue" => 0 }

  # split into selections at ';'
  selections.split(';').each do |selection|
    # split selections at ','
    selection.split(',').each do |color|
      (count, color_key) = color.split(' ')
      # insert into cube map if appropriate
        if count.to_i > cube_map[color_key]
          cube_map[color_key] = count.to_i
      end
    end
  end
  # Add "power" to total
  total += cube_map.values.inject(:*)
end

puts total