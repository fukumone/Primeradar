class TopController < ApplicationController
  before_action :range_number

  def index
    if params[:prime_number].present?
      @prime = params[:prime_number].to_i
    end
  end

  def search
  end

  private
  def range_number
    @prime_number_from = 1
    @prime_number_to = 50
    if params[:prime_number_to].present?
      @prime_number_to = params[:prime_number_to].to_i
    end
    if params[:prime_number_from].present?
      @prime_number_from = params[:prime_number_from].to_i
    end
  end
end
