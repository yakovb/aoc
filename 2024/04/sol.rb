#!/usr/bin/env ruby

$grid = File
    .readlines(ARGV[0])
    .map { |line| line.chomp.chars }

rmax = $grid.size
cmax = $grid.first.size

def xmas(idxs)
    return 0 if idxs.flatten.any? { |i| i < 0 }
    idxs
        .map { |r,c| $grid.dig(r,c) }
        .join == "XMAS" ? 1 : 0
end

def fwd(i)
    (i..(i+3)).to_a
end
def bwd(i)
    ((i-3)..i).to_a.reverse
end
def const(i)
    Array.new(4, i)
end

### ### ###
def right(r,c)
    xmas( (const(r)).zip( fwd(c) ) )
end

def left(r,c)
    xmas( const(r).zip( bwd(c) ) )
end

def up(r,c)
    xmas( bwd(r).zip( const(c) ) )
end

def down(r,c)
    xmas( fwd(r).zip( const(c) ) )
end

def upright(r,c)
    xmas( bwd(r).zip( fwd(c) ) )
end

def upleft(r,c)
    xmas( bwd(r).zip( bwd(c) ) )
end

def downright(r,c)
    xmas( fwd(r).zip( fwd(c) ) )
end

def downleft(r,c)
    xmas( fwd(r).zip( bwd(c) ) )
end
### ### ###

def check(r,c)
    right(r,c) + left(r,c) + up(r,c) + down(r,c) +
        upright(r,c) + upleft(r,c) + downright(r,c) + downleft(r,c)
end

nxmas = 0
(0...rmax).each do |row|
    (0...cmax).each do |col|
        nxmas += check(row, col)
    end
end

p nxmas