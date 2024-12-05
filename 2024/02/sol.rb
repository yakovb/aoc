data = File
  .readlines(ARGV[0])
  .map { |s| s.scan(/\d+/).map &:to_i }

data.each do |r|
  unless r.each_cons(2).all? { |a,b| a >=b }
    r.reverse!
  end
end

one = []
data.each do |rec|
    decr = []
    rec.each_cons(2) do |rec| 
      a,b = rec; 
      decr << (a-b).between?(1, 3)
    end
    one << decr
  end  

p one.map { |rep| rep.all? }.count true