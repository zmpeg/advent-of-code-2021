#!/usr/bin/env ruby

$fishes = File.read('input.txt').split(",")
  .reduce(Array.new(9).fill(0)) do |s, f|
    s[f.to_i] += 1
    s
  end

(1..256).each do |day|
  $fishes.push($fishes.shift)
  $fishes[6] += $fishes[8]
  puts "After #{'%3.3s' % day.to_s} day: #{$fishes.inject(:+)}"
end
