class TopController < ApplicationController
  before_action :check_prime_number
  # before_action :range_number
  # before_action :twins_range_number

  include ErrorsHelper

  def index
    if params[:prime_number].present?
      @prime = params[:prime_number].to_i
    end
    @search_range = PrimeNumber.search_range_prime(params)
    @search_twins_range = PrimeNumber.search_twins_range_prime(params)
  end

  def search
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
