#!/usr/bin/env ruby

h = File.read("input.txt").split("\n").map{|r| r.chars.map(&:to_i)}

sum = 0

for r in 0..h.size-1 do
	for c in 0..h[0].size-1 do
		th = h[r][c]
		hs = [h[r][c]]
		hs.push h[r-1][c] if r > 0
		hs.push h[r+1][c] if r != h.size-1
		hs.push h[r][c-1] if c > 0
		hs.push h[r][c+1] if c != h[r].size-1

		if hs.min == th && hs.count(th) == 1
			sum += th+1
			print th+1
		else
			print "_"
		end
	end
	print "\n"
end

print "Sum: #{sum}\n"