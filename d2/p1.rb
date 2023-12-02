#!/usr/bin/env ruby


# Open file
input_file = "input.txt"
puts("Reading file #{input_file}")
file = File.open(input_file)

# Read file
data = file.read

# Split contents into an array
data_array = data.split("\n")

limit_map = { "red" => 12,
             "green" => 13,
             "blue" => 14}

total = 0

data_array.each do |line|
  valid_game = true # assume valid game

  # split off game number
  (game, selections) = line.split(':')
  game_val = game.split.last.to_i

  # split into selections at ';'
  selections.split(';').each do |selection|
    # split selections at ','
    selection.split(',').each do |color|
      (count, color_key) = color.split(' ')
      # check against limit map
      if count.to_i > limit_map[color_key]
        # if any limit exceeded, mark game as false
        valid_game = false
      end
    end
  end
  total += game_val if valid_game
end

puts total