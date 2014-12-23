# == Schema Information
#
# Table name: prime_numbers
#
#  id           :integer          not null, primary key
#  prime_number :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class PrimeNumber < ActiveRecord::Base

  class << self

    ### 素数検索 ###
    def search_range_prime(prime_number_from, prime_number_to)
      prime(prime_number_from, prime_number_to).to_a(:as => :hash)
    end

    ### 双子素数検索 ###
    def search_twins_range_prime(twins_prime_number_from, twins_prime_number_to)
      results = prime(twins_prime_number_from, twins_prime_number_to).to_a.flatten
      results.each_cons(2).select{ |b, r| (r - b) == 2}
    end

    ### 三つ子素数検索　###
    def search_prime_triplet(prime_triplet_from, prime_triplet_to)
      results = prime(prime_triplet_from, prime_triplet_to).to_a.flatten
      results.each_cons(3).select{ |a, b, c| (b - a == 2 && c - a == 6) || (b - a == 4 && c - a == 6) }
    end

    ### 四つ子素数検索　###
    def search_prime_quadruplet(prime_quadruplet_from, prime_quadruplet_to)
      results = prime(prime_quadruplet_from, prime_quadruplet_to).to_a.flatten
      results.each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
    end

    private
    def prime(int_a, int_b)
      ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
      (#{int_a.to_i} < prime_number and prime_number < #{int_b.to_i})")
    end
  end

end
