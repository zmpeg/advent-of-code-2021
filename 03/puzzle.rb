#!/usr/bin/env ruby

nums = File.readlines('input.txt').collect(&:strip)

rows = nums.length
sums = nums.reduce(Array.new(nums[0].length).fill(0)) do |sum, r|
  sum.map.with_index{|s, i| s+=r[i].to_i}
end

most_common = sums.map{|n| n > 500 ? '1' : '0'}.join().to_i(2)
less_common = sums.map{|n| n > 500 ? '0' : '1'}.join().to_i(2)

p most_common * less_common
