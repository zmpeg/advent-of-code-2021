#!/usr/bin/env ruby

nums = File.readlines('input.txt').map{|n| Integer(n.strip)}

last = 999999999
increased = 0
nums.each do |n|
  increased += 1 if n > last
  last = n
end

p increased