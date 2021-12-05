#!/usr/bin/env ruby
input = File.readlines('input.txt').collect(&:strip).reject{ |c| c.empty? }

class Board
  def initialize(b, n)
    @board = b.map{|r| r.split}
    @num = n
  end

  def to_s
    "== Board #{'%2.2s' % @num} ==\n" + @board.map do |row|
      '%14.14s' % row.map{|i| ('%3.3s' % i)}.join.strip
    end.join("\n") + "\n"
  end

  def play(draw)
    @board.map! do |row|
      row.map{|i| i==draw ? "X" : i}
    end
  end

  def rotate
    @board.transpose.map(&:reverse)
  end

  def win?
    (@board + rotate).map{|r| r.join}.any? "XXXXX"
  end

  def sum_unmarked
    @board.map{|r| r.reject{|i| i=="X"}}.flatten.map(&:to_i).reduce(:+)
  end
end

def winning(boards)
  boards.select{|b| b.win?}
end

def losing(boards)
  boards.select{|b| !b.win?}
end

draws = input.shift().split(",")
boards = []

(0..(input.length/5)-1).each do |i|
  boards.push(Board.new input.shift(5), i)
end

while winning(boards).empty? do
  draw = draws.shift
  boards.each{|b| b.play draw }
  
  if !winning(boards).empty? then
    print winning(boards)[0].to_s
    print "Part one answer #{winning(boards)[0].sum_unmarked * draw.to_i}\n"
  end
end

while losing(boards).length != 1 do
  draw = draws.shift
  boards.each{|b| b.play draw }
end

losing_board = losing(boards)[0]

last_draw = nil
while !losing_board.win? do
  last_draw = draws.shift
  losing_board.play last_draw
end

print losing_board.to_s
print "Part two answer #{losing_board.sum_unmarked * last_draw.to_i}\n"

# print boards.map{|b| b.to_s}.join("\n")