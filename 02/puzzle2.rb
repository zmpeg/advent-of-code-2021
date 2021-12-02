#!/usr/bin/env ruby

nums = File.readlines('input.txt')#.map{|n| Integer(n.strip)}

t = { "depth" => 0, "aim" => 0, "hoz" => 0 }
nums.each do |n|
  v,m = n.split(" ")
  t['aim'] += m.to_i if v == "down"
  t['aim'] -= m.to_i if v == "up"
  
  if v == "forward" then
    t['hoz'] += m.to_i
    t['depth'] += t['aim'] * m.to_i
  end

end

p (t["hoz"] * t["depth"])