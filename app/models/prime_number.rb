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

    def search_range_prime(params)
      results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
        (#{params[:prime_number_from].to_i} < prime_number and prime_number < #{params[:prime_number_to].to_i})")
      results.to_a(:as => :hash)
    end

    def search_twins_range_prime(params)
      results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
        (#{params[:twins_prime_number_from].to_i} < prime_number and prime_number < #{params[:twins_prime_number_to].to_i})")
      results.each_cons(2).select{ |b, r| (r.last - b.first) == 2}
    end

    # def search_range_prime(params)
    #   PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     params[:prime_number_from], params[:prime_number_to])
    # end

    # def search_twins_range_prime(params)
    #   arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
    #     params[:twins_prime_number_from], params[:twins_prime_number_to])
    #   arr.map(&:prime_number).each_cons(2).select{ |b, r| (r - b) == 2}
    # end

  end
end
