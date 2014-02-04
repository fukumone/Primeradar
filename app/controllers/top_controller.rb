class TopController < ApplicationController
  # before_action :check_prime_number
  # before_action :range_number
  # before_action :twins_range_number

  # include ErrorsHelper

  def index

  end

  def search
    if params[:prime_number].present?
      @prime = params[:prime_number].to_i
      render "index"
    end
  end

  def search_prime
    result_one = PrimeNumber.search_range_prime(params)
    if result_one.kind_of?(Hash)
      @error_range = result_one
    else
      @search_range = result_one
      render "index"
    end
  end

  def search_twins_prime
    result_two = PrimeNumber.search_twins_range_prime(params)
    if result_two.kind_of?(Hash)
      @error_twins = result_two
    else
      @search_twins_range = result_two
      render "index"
    end
  end

  # private
  # def range_number
  #   @prime_number_from = 1
  #   if params[:prime_number_to].present?
  #     @prime_number_to = params[:prime_number_to].to_i
  #   end
  #   if params[:prime_number_from].present?
  #     @prime_number_from = params[:prime_number_from].to_i
  #   end
  # end

  # def twins_range_number
  #   @twins_prime_number_from = 0
  #   if params[:twins_prime_number_to].present?
  #     @twins_prime_number_to = params[:twins_prime_number_to].to_i
  #   end
  #   if params[:twins_prime_number_from].present?
  #     @twins_prime_number_from = params[:twins_prime_number_from].to_i
  #   end
  # end

end
