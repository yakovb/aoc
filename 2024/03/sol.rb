#!/usr/bin/env ruby

input = File.read(ARGV[0])

def mul(str)
    str
        .scan( /mul\((\d{1,3}),(\d{1,3})\)/ )
        .sum { |a,b| a.to_i * b.to_i }
end

# one
p mul(input)

# two
p input
    .split(/do\(\)/)
    .map { |part| part.split(/don't\(\)/).first }
    .sum { |s| mul(s) }