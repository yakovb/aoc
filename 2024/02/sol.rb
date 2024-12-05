data = File
  .readlines(ARGV[0])
  .map { |s| s.scan(/\d+/).map &:to_i }

data.each do |r|
  unless r == r.sort
    r.reverse!
  end
end

p data.map { |rec| 
  rec.each_cons(2).all? { |a,b| (b-a).between?(1, 3) }
}.count true