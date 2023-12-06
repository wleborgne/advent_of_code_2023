#!/usr/bin/env ruby

times = []
distances = []
product = 1

times.each_with_index do |t, i|
  count = 0
  (1..t - 1).each do |x|
    if x * (t-x) > distances[i]
      count += 1
    end
  end
  product *= count
end

puts product