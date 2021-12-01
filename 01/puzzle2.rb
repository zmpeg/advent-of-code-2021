#!/usr/bin/env ruby

nums = File.readlines('input.txt').map{|n| Integer(n.strip)}

increases = 0
nums.reduce(nums.shift(3)) do |lasts, n|
  last = lasts.reduce(:+)
  lasts.push(n).shift
  increases += 1 if lasts.reduce(:+) > last
  lasts
end

p increases
