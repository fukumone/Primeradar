module PrimeHelper

  def prime_number(number)
    sqrt = Math.sqrt(number)
    factor_found = (2..sqrt).any? { |i| number % i == 0 }
    if factor_found || number == 1
      "#{number_with_delimiter(number)}は素数ではない\n"
    else
      "#{number_with_delimiter(number)}は素数である\n"
    end
  end

end
