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
card_counts = Hash.new(0)
cards = Hash.new

# add each card to cards hash; key = game num as int
# increment card_counts as we're adding the initial cards
# as we process each card, and count winners, increment
# the value in card_counts
data_array.each do |line| 
  (card, numbers) = line.split(':')
  game_number = card.split(' ').last.to_i
  card_counts[game_number] += 1

    res = []
    (winning_numbers, my_numbers) = numbers.split('|')

    my_numbers.split(' ').each do |number|
      res += winning_numbers.scan(" #{number} ")
    end

    if res.size > 0
      ((game_number + 1)..(game_number + res.size)).each { |x| card_counts[x] += card_counts[game_number] }
    end
end

puts card_counts.values.inject(:+)