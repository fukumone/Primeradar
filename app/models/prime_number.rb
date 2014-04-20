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
      to_proc(prime_number_from, prime_number_to).to_a(:as => :hash)
    end

    ### 双子素数検索 ###
    def search_twins_range_prime(twins_prime_number_from, twins_prime_number_to)
      results = to_proc(twins_prime_number_from, twins_prime_number_to).to_a.flatten
      results.each_cons(2).select{ |b, r| (r - b) == 2}
    end

    ### 三つ子素数検索　###
    def search_prime_triplet(prime_triplet_from, prime_triplet_to)
      results = to_proc(prime_triplet_from, prime_triplet_to).to_a.flatten
      results.each_cons(3).tap{|a| a}.select{ |a, b, c| (b - a == 2 && c - a == 6) || (b - a == 4 && c - a == 6) }
    end

    ### 四つ子素数検索　###
    def search_prime_quadruplet(prime_quadruplet_from, prime_quadruplet_to)
      results = to_proc(prime_quadruplet_from, prime_quadruplet_to).to_a.flatten
      results.each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
    end

    private
    def to_proc(int_a, int_b)
      Proc.new { |int_a, int_b|
        ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
        (#{int_a.to_i} < prime_number and prime_number < #{int_b.to_i})")
      }.call(int_a, int_b)
    end

############ active_recordで検索 ####################################################
     ### 素数検索 ###
    # def search_range_prime(prime_number_from=1, prime_number_to)
    #   PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     prime_number_from, prime_number_to)
    # end

    ### 双子素数検索 ###
    # def search_twins_range_prime(twins_prime_number_from=1, twins_prime_number_to)
    #   arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     twins_prime_number_from, twins_prime_number_to)

    #   arr.map(&:prime_number).each_cons(2).select{ |b, r| (r - b) == 2 }
    # end

    ### 三つ子素数検索　###
    # def search_prime_triplet(prime_triplet_from, prime_triplet_to)
    #   arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     prime_triplet_from, prime_triplet_to)
    #   arr.each_cons(3).tap{|a| a}.select{ |a, b, c| (b - a == 2 && c - a == 6) || (b - a == 4 && c - a == 6) }
    # end

    ### 四つ子素数検索　###
    # def search_prime_quadruplet(prime_quadruplet_from, prime_quadruplet_to)
    #   arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     prime_quadruplet_from, prime_quadruplet_to)
    #   arr.map(&:prime_number).each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
    # end
#####################################################################################
  end

end
