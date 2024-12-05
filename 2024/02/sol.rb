data = File
  .readlines(ARGV[0])
  .map { |s| s.scan(/\d+/).map &:to_i }

data.each do |r|
  unless r == r.sort
    r.reverse!
  end
end

def safe(arr)
  arr.each_cons(2).all? { |a,b| (b-a).between?(1, 3) }
end

# one
p data.map { |r| safe(r) }.count true