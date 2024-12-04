#!/usr/bin/env ruby

as = []
bs = []
File.open(ARGV[0])
  .readlines
  .map do |l|
    l.split(/\s+/)
      .map(&:to_i)
  end
    .each do |l|
      a,b = l
      as << a
      bs << b
    end

as.sort!
bs.sort!

# one
puts as.zip(bs)
  .map { |pair| a,b = pair; (a-b).abs }
  .reduce(0, &:+)

# two
bfreq = bs.tally
puts as.map { |a| bfreq.fetch(a,0) * a }
  .sum

