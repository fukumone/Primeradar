module PrimeSpecHelper
  def prime_number_range_search(n)
    array = []
    prime_number = lambda { |times|
    sqrt = Math.sqrt(times)
    factor_number = (2..sqrt).any? { |num| times % num == 0 }
    unless factor_number || times == 1
      array << times
    end
    }
    (1..n).each do |times|
      prime_number.call(times)
    end
    array.compact
  end
end
