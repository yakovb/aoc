#!/usr/bin/env ruby

data = File
  .readlines(ARGV[0])
  .map { |l| l.scan(/\d+/).map &:to_i }
  .transpose
  .map &:sort

# one
p data.transpose.sum { |a,b| (a-b).abs }

# two
freq = data[1].tally
p data.transpose.sum { |a,b| freq.fetch(a,0) * a }