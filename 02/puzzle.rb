#!/usr/bin/env ruby

nums = File.readlines('input.txt')#.map{|n| Integer(n.strip)}

t = { "up" => 0, "forward" => 0, "down" => 0 }
nums.each do |n|
  v,m = n.split(" ")
  t[v] += Integer(m)
end

p t["forward"] * ( t["down"] - t["up"])