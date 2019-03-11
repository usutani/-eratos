class Eratos
  def self.primes(n)
    primes = []
    numbers = (2..n).to_a
    limit = Math.sqrt(n)

    loop do
      head  = numbers.shift
      primes << head
      break if head  >= limit
      to_delete = []
      numbers.each do |e|
        to_delete << e if e % head == 0
      end
      numbers -= to_delete
    end

    primes += numbers
  end
end

def first_arg
  return nil if ARGV.size != 1
  val = Integer(ARGV[0])
  return nil if val <= 1
  val
rescue
  nil
end

if $0 == __FILE__
  val = first_arg
  unless val
    p 'Usage: ruby eratos.rb 1より大きい自然数'
    exit
  end
  p Eratos.primes(val)
end
