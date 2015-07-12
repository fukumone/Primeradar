module PrimeSpecHelper
  def prime_number_range_search(n)
    array = []
    prime_number = lambda do |times|
      sqrt = Math.sqrt(times)
      factor_number = (2..sqrt).any? { |num| times % num == 0 }
      array << times unless factor_number || times == 1
    end
    (1..n).each do |times|
      prime_number.call(times)
    end
    array.compact
  end
end
