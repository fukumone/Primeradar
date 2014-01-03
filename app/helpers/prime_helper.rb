module PrimeHelper

  def prime_number(prime)
    arr = []
    (1..prime).each do |num|
      if prime % num == 0
        arr << num
      end
    end

    if arr.count < 3 && prime != 1 && 0 < prime
      "#{prime}は素数です"
    else
      "#{prime}は素数ではない"
    end
  end

end
