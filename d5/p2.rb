#!/usr/bin/env ruby
def get_next_line(file)
  result = file.readline(chomp: true).split(" ").map { |num| Integer(num) }
  if result.empty?
    return nil
  end
  return result
end

def transform(name, incoming_list, file)
  next_line = file.readline(chomp: true)
  puts next_line
  if  next_line == name
    new_list = []
    temp_list = incoming_list
    while ((dest, source, interval) = get_next_line(file))
      puts("\tDest: #{dest}\tSource: #{source}\tRange: #{interval}")
      temp_list.each_with_index do |num, i|
        if num.between?(source, source + interval - 1)
          new_list << dest + (num - source)
          temp_list[i] = nil
        end
      end
    temp_list.compact!
    end
    new_list += temp_list.compact
    incoming_list = new_list.sort
  else
    puts("UNEXPECTED CATEGORY: #{next_line}")
    exit
  end

  return incoming_list
end


# Open file
input_file = "input.txt"
puts("Reading file #{input_file}")
file = File.open(input_file)

transform_list = ["seed-to-soil map:",
                  "soil-to-fertilizer map:",
                  "fertilizer-to-water map:",
                  "water-to-light map:",
                  "light-to-temperature map:",
                  "temperature-to-humidity map:",
                  "humidity-to-location map:"]
# Read file
seeds_line = file.readline()

seed_list = seeds_line.split(': ').last.split(' ').map { |num| Integer(num)}

puts seed_list.inspect

holding_list = []
seed_list.each_with_index do |num, index|
  next if index.odd?
  holding_list += (num..(num + seed_list[index + 1] - 1)).to_a
end

puts file.readline() # blank line

transform_list.each do |transform_name|
  holding_list = transform(transform_name, holding_list, file)
end

puts holding_list[0]