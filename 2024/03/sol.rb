#!/usr/bin/env ruby

p File
    .readlines(ARGV[0])
    .map { |line| line.scan(/mul\(\d{1,3},\d{1,3}\)/) }
    .map { |mul| 
        mul.map { |s| s.scan(/\d{1,3}/).map &:to_i } }
    .map { |line| 
        line.sum { |pair| a,b = pair; a*b } }
    .sum