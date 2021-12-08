#!/usr/bin/env ruby

class Rule
  def initialize(r)
    @x1, @y1, @x2, @y2 = r.flatten
  end

  def diagonal?
    @x1 != @x2 && @y1 != @y2
  end

  def points
    print "Drawing from #{@x1},#{@y1} to #{@x2},#{@y2}\n"
    if @x1 == @x2
      y1, y2 = [@y1, @y2].sort
      return (y1..y2).map{|y| [@x1, y]}
    end
    if @y1 == @y2
      x1, x2 = [@x1, @x2].sort
      return (x1..x2).map{|x| [x, @y1]}
    end
    if (@x1-@x2).abs == (@y1-@y2).abs
      range = (@x1-@x2).abs
      print "Diagonal! 0..#{range} (#{@x1},#{@y1}) -> (#{@x2},#{@y2})\n"
      x_vector = (@x2 - @x1) / range
      y_vector = (@y2 - @y1) / range
      return (0..range).map{|n| [@x1 + x_vector * n, @y1 + y_vector * n] }
    end
  end
end

points = {}
points.default = 0
File.readlines('input.txt')
  .collect(&:strip)
  .map do |r|
    r.split(" -> ").map{|p| p.split(",").map(&:to_i)}
  end
  .map{|r| Rule.new r }
  .map(&:points)
  .each do |o|
    o.each do |p|
      points[p.join ','] += 1
    end
  end

puts points.select{|k,v| v > 1}.keys.uniq.size

(0..9).each do |y|
  (0..9).each do |x|
    print points["#{x},#{y}"].to_s.sub("0",".")
  end
  print "\n"
end


