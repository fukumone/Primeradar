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

  # def prime_number_count
  #   arr = []
  #   (@prime_number_from..@prime_number_to).each do |num|
  #     arr << prime_number(num)
  #   end
  #   arr.compact
  # end

  # def twins_prime_number_count
  #   arr = []
  #   arr_2 = []
  #   (@prime_number_from..@prime_number_to).each do |num|
  #     arr << prime_number(num)
  #   end
  #   arr = arr.compact
  #   arr.map(&:to_i).each_cons(2).select{ |b, r| (r - b) == 2}.count
  # end

  # def twins_prime_number
  #   arr = []
  #   arr_2 = []
  #   (@twins_prime_number_from..@twins_prime_number_to).each do |num|
  #     arr << prime_number(num)
  #   end
  #   arr = arr.uniq.compact
  #   arr.map(&:to_i).uniq.each_cons(2).select{ |b, r| (r - b) == 2}
  # end

  # def twins_prime_number_count_2
  #   arr = []
  #   arr_2 = []
  #   (@twins_prime_number_from..@twins_prime_number_to).each do |num|
  #     arr << prime_number(num)
  #   end
  #   arr = arr.compact.uniq
  #   arr.map(&:to_i).each_cons(2).select{ |b, r| (r - b) == 2}.count
  # end

end
