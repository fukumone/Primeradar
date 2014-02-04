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
    # def search_range_prime(params)
    #   results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
    #     (#{params[:prime_number_from].to_i} < prime_number and prime_number < #{params[:prime_number_to].to_i})")
    #   results.to_a(:as => :hash)
    # end

    ### SQLを使った検索 ###
    # def search_twins_range_prime(params)
    #   results = ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
    #     (#{params[:twins_prime_number_from].to_i} < prime_number and prime_number < #{params[:twins_prime_number_to].to_i})")
    #   results.each_cons(2).select{ |b, r| (r.last - b.first) == 2}
    # end

    ### 素数検索 ###
    def search_range_prime(params)
      error = search_error_range_prime(params)
      if error.present?
        return error
      else
        PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
          params[:prime_number_from], params[:prime_number_to])
      end
    end

    ### 双子素数検索 ###
    def search_twins_range_prime(params)
      error = search_error_twins_range_prime(params)
      if error.present?
        return error
      else
        arr = PrimeNumber.where("? <= prime_number and prime_number <= ?" ,
          params[:twins_prime_number_from], params[:twins_prime_number_to])

        arr.map(&:prime_number).each_cons(2).select{ |b, r| (r - b) == 2}
      end
    end

    private

    def search_error_range_prime(params)
      error = {}
      if params[:prime_number_from].present? || params[:prime_number_to].present?
        unless params[:prime_number_from] =~ /\A[0-9]+\z/ || params[:prime_number_to] =~ /\A[0-9]+\z/
          error[:only_integer_range] = "※半角数字で記入してください"
        end
      end
    end

    def search_error_twins_range_prime(params)
      error = {}
      if params[:twins_prime_number_from].present? || params[:twins_prime_number_to].present?
        unless params[:twins_prime_number_from] =~ /\A[0-9]+\z/ || params[:twins_prime_number_to] =~ /\A[0-9]+\z/
           error[:only_integer_twins_range] = "※半角数字で記入してください"
        end
      end
    end
  end

end
