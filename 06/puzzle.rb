#!/usr/bin/env ruby

$fishes = []

class Fish
  def initialize(timer)
    @timer = timer
  end

  def timer
    @timer
  end

  def to_s
    "#<Fish#{object_id} @timer=#{@timer}>"
  end

  def age
    if @timer == 0
      @timer = 7
      $fishes.push Fish.new(9)
    end
    @timer -= 1
  end
end

class String
  def to_fish
    return Fish.new self.to_i
  end
end

$fishes = File.read('input.txt')
  .split(",")
  .map(&:to_fish)

puts "Initial state: #{$fishes.map(&:timer).join(',')}"
(1..80).each do |day|
  $fishes.each{|f| f.age}
  puts "After #{'%3.3s' % day.to_s} day: #{$fishes.map(&:timer).size}"
end
