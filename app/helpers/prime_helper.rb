module PrimeHelper

  def prime_number(number)
    sqrt = Math.sqrt(number)
    factor_found = (2..sqrt).any? { |i| number % i == 0 }
    unless factor_found || number == 1 || number == 0
      number_with_delimiter(number)
    end
  end

  def composite_number(number)
    sqrt = Math.sqrt(number)
    factor_found = (2..sqrt).any? { |i| number % i == 0 }
    if factor_found || number == 1 || number == 0
      number_with_delimiter(number)
    end
  end

  def prime_number_count
    arr = []
    (@prime_number_from..@prime_number_to).each do |num|
      arr << prime_number(num)
    end
    arr.compact
  end

end
