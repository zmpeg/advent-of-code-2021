#!/usr/bin/env ruby

crabs = File.read('input.txt').split(",").map(&:to_i)

def crab_cost(crab, pos)
  # Part one answer
  # (crab-pos).abs

  # part 2 answer
  (0..(crab-pos).abs).sum
end

p (crabs.min..crabs.max).map{|pos|
  crabs.reduce(0) {|fuel, crab| crab_cost(crab, pos) + fuel }
}.min
