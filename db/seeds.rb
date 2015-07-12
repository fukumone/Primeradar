require 'prime'

if Rails.env == 'development'
  arr_prime = []
  Prime.each(10**6) do |prime|
    arr_prime << PrimeNumber.new(prime_number: prime)
  end
  PrimeNumber.import arr_prime
elsif Rails.env == 'test'
  Prime.each(100) do |prime|
    PrimeNumber.create(prime_number: prime)
  end
end
