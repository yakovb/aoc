data = File
  .readlines(ARGV[0])
  .map { |s| s.scan(/\d+/).map &:to_i }

def norm(arr)
  arr == arr.sort ? arr : arr.reverse
end

def safe(arr)
  norm(arr).each_cons(2).all? { |a,b| (b-a).between?(1, 3) }
end

# one
p data.map { |r| safe(r) }.count true

# two
p data.map { |r| 
  (0...r.length).map { |i| a = r.drop(0); a.delete_at(i); a }
    .map { |perm| safe(perm) }
    .any?
}.count true