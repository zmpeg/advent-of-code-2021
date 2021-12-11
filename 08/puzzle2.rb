#!/usr/bin/env ruby

class Line
  def initialize(input)
    @patterns, @output = input.split("|").map{|p| p.split(" ").map{|s| s.chars.sort.join }}
    @mapping = [zero, one, two, three, four, five, six, seven, eight, nine]
  end

  def mapping
    @mapping
  end

  def zero
    @patterns.select{|p| p.length == 6 && (p.chars + hoz).uniq.length == 7}.first
  end

  def one
    @patterns.select{|p| p.length == 2}.first
  end

  def two
    two_or_five.reject{|p| p==five}.first
  end

  def three
    @patterns.select{|p| p.length == 5 && (p.chars - one.chars).length == 3}.first
  end

  def four
    @patterns.select{|p| p.length == 4}.first
  end

  def five
    two_or_five.select{|p| (p.chars - (hoz + left_top.chars)).length == 1 }.first
  end

  def six
    @patterns.select{|p| p.length == 6 && (p.chars + one.chars).uniq.length == 7}.first
  end

  def seven
    @patterns.select{|p| p.length == 3 }.first
  end
  
  def eight
    @patterns.select{|p| p.length == 7}.first
  end

  def nine
    @patterns.select{|p| p.length == 6 && p!=six && p!=zero}.first
  end

  def top
    (seven.chars - one.chars).first
  end

  def hoz
    (three.chars - one.chars)
  end

  def middle
    (eight.chars - zero.chars).first
  end

  def left_top
    (four.chars - (one.chars + middle.chars)).first
  end

  def two_or_five
    @patterns.select{|p| p.length==5 && p!=three}
  end

  def solve
    @output.map{|o| mapping.index(o).to_s}.join("").to_i
  end
end

input = File.read("input.txt").split("\n")
  .map{|l| Line.new(l)}

p input.map(&:solve).sum