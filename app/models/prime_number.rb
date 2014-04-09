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

    ### SQLを使った検索 ###
      ### 素数検索 ###
    def search_range_prime(prime_number_from, prime_number_to)
      results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
        (#{prime_number_from.to_i} < prime_number and prime_number < #{prime_number_to.to_i})")
      results.to_a(:as => :hash)
    end

    # ### SQLを使った検索 ###
    #   ### 双子素数検索 ###
    def search_twins_range_prime(twins_prime_number_from, twins_prime_number_to)
      results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
        (#{twins_prime_number_from.to_i} < prime_number and prime_number < #{twins_prime_number_to.to_i})")
      results.each_cons(2).select{ |b, r| (r.last - b.first) == 2}
    end

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
    def search_prime_triplet(prime_triplet_from=1, prime_triplet_to)
      arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
        prime_triplet_from, prime_triplet_to)
      arr.map(&:prime_number).each_cons(3).select{ |a, b, c| (b - a == 2 && c - a == 6) || (b - a == 4 && c - a == 6) }
    end

    ### 四つ子素数検索　###
    def search_prime_quadruplet(prime_quadruplet_from=1, prime_quadruplet_to)
      arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
        prime_quadruplet_from, prime_quadruplet_to)
      arr.map(&:prime_number).each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
    end

    ### ゴールドバッハ予想検索 ###
    # def search_goldbachs_conjecture(goldbachs_conjecture_number)
    #   prime_sum = 0
    #   if goldbachs_conjecture_number.even? &&  2 < goldbachs_conjecture_number

    #   else
    #     raise "４以上の偶数を入力してください。"
    #   end
    # end

    ###コールドバッハアルゴリズムめも
    # str = ""
    # array = []
    # a.each do |str|
    #   array << str
    #   p array
    # end
    # p array.join(",").gsub(",", "+")

    #

    ### フェルマーの小定理検索　###
    # def fermats_little_theorem_search(fermats_little_value)
    # end
  end

end

# array = []
# arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,1,10000)
#  arr.map(&:prime_number).each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
# array.last
