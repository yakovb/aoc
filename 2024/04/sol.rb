#!/usr/bin/env ruby

$grid = File
    .readlines(ARGV[0])
    .map { |line| line.chomp.chars }

$rmax = $grid.size
$cmax = $grid.first.size


def word(idxs, str)
    return 0 if idxs.flatten.any? { |i| i < 0 || i >= $rmax }
    idxs
        .map { |r,c| $grid.dig(r,c) }
        .join
        .match?(str) ? 1 : 0
end

def fwd(i)
    (i..(i+$diaglen)).to_a
end
def bwd(i)
    ((i-$diaglen)..i).to_a.reverse
end
def const(i)
    Array.new(4, i)
end

### ### ###
def right(r,c)
    const(r).zip( fwd(c) )
end

def left(r,c)
    const(r).zip( bwd(c) )
end

def up(r,c)
    bwd(r).zip( const(c) )
end

def down(r,c)
    fwd(r).zip( const(c) )
end

def upright(r,c)
    bwd(r).zip( fwd(c) )
end

def upleft(r,c)
    bwd(r).zip( bwd(c) )
end

def downright(r,c)
    fwd(r).zip( fwd(c) )
end

def downleft(r,c)
    fwd(r).zip( bwd(c) )
end
### ### ###

def xmas(r,c)
    [right(r,c), left(r,c), up(r,c), down(r,c),
        upright(r,c), upleft(r,c), downright(r,c), downleft(r,c)]
        .sum { |idx| word(idx, "XMAS") }
end

def mas(r,c)
    m = [downright(r,c), upright(r+2, c)]
            .sum { |idx| word( idx, Regexp.new("^(MAS|SAM)") ) }
    m == 2 ? 1 : 0
end

nxmas = 0
nmas = 0
(0...$rmax).each do |row|
    (0...$cmax).each do |col|
        $diaglen = 3
        nxmas += xmas(row, col)
        $diaglen = 2
        nmas += mas(row, col)
    end
end

p nxmas
p nmas