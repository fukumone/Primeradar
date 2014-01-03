module PrimeHelper

  def prime_number(number)
    sqrt = Math.sqrt(number)
    factor_found = (2..sqrt).any? { |i| number % i == 0 }
    unless factor_found || number == 1
      number_with_delimiter(number)
    end
  end

  def composite_number(number)
    sqrt = Math.sqrt(number)
    factor_found = (2..sqrt).any? { |i| number % i == 0 }
    if factor_found || number == 1
      number_with_delimiter(number)
    end
  end

end
