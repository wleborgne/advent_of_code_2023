#!/usr/bin/env ruby

time = 1
distance = 1

count = 0
(1..time - 1).each do |x|
  if x * (time-x) > distance
    count += 1
  end
end

puts count