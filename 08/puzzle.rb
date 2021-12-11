#!/usr/bin/env ruby

input = File.read("input.txt").split("\n")

puts input
  .map{|l| l.split("|")[1].split(" ")}
  .flatten
  .select{|l| [2,3,4,7].include? l.length}
  .count
