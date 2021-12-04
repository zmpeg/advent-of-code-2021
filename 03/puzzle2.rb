#!/usr/bin/env ruby

nums = File.readlines('input.txt').collect(&:strip)
(0..11).each do |i|
  counts = nums.map{|n| n[i]}.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h

  next if nums.length == 1
  counts["0"] = 0 if !counts.has_key? "0"
  counts["1"] = 0 if !counts.has_key? "1"
  if counts["1"] != counts["0"] then
    larger = counts["1"] > counts["0"] ? "1" : "0"
    nums.select!{|n| n[i]==larger}
  else
    nums.select!{|n| n[i]=="1"}
  end

  p "#{i}: #{nums.length} remaining"
end

first = nums[0].to_i(2)
p "selection is #{first} (#{nums[0]})"

nums = File.readlines('input.txt').collect(&:strip)
(0..11).each do |i|
  counts = nums.map{|n| n[i]}.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h

  next if nums.length == 1
  counts["0"] = 0 if !counts.has_key? "0"
  counts["1"] = 0 if !counts.has_key? "1"
  p counts
  if counts["1"] != counts["0"] then
    smaller = counts["1"] > counts["0"] ? "0" : "1"
    nums.select!{|n| n[i]==smaller}
  else
    nums.select!{|n| n[i]=="0"}
  end

  p "#{i}: #{nums.length} remaining, smaller was #{smaller}"
end

second = nums[0].to_i(2)
p "selection is #{second} (#{nums[0]})"
p "answer is #{second * first}"


# rows = nums.length
# sums = nums.reduce(Array.new(nums[0].length).fill(0)) do |sum, r|
#   sum.map.with_index{|s, i| s+=r[i].to_i}
# end

# (1..nums[0].length).each do |i|
#   nums = nums.select do |n|
#     p sums[i-1]
#     sums[i-1] == 500 || n[i-1] == "1" && sums[i-1] > 500
#   end
#   p nums.length
# end

# p nums
