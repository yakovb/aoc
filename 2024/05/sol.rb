input = File.readlines(ARGV[0])
  .map { |line| line.chomp }
  .partition { |line| line.include?("|") }
  .map { |l| l.reject { |line| line.empty? } }

rules = {}
input
  .first
  .each do |r|
    a,b = r.split('|').map &:to_i
    rules.key? a  ?  rules[a] << b  :  rules[a] = [b]
  end

updates = input[1]
  .map { |line|  line.split(',').map &:to_i }

one = []
updates
  .map { |u|
    heads = []
    tails = []
    u.each_with_index do |n, i|
      heads += u[0...i].map { |m| rules.fetch(m, []).include? n }
      tails += u[i+1...u.size].map { |m| rules.fetch(n, []).include? m }
    end
    one << u if heads.all? && tails.all?
  }

# one
p one.sum { |o| o[o.size/2] }