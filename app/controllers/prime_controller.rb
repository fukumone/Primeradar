class PrimeController < ApplicationController
  before_action :instance_search_form_get, only: [ :twins_prime, :prime_triplet, :prime_quadruplet ]

  def introduction_prime
  end

  def history_prime
  end

  def twins_prime
    if @search.valid?
      @twins_prime = @search.twins_range_prime
      @twins_prime = Kaminari.paginate_array(@twins_prime).page(params[:page]).per(1000)
    else
      flash.now.alert  = format_errors(@search)
    end
  end

  def largest_prime
  end

  def prime_triplet
    if @search.valid?
      @prime_triplet = @search.prime_triplet
      @prime_triplet = Kaminari.paginate_array(@prime_triplet).page(params[:page]).per(500)
    else
      flash.now.alert  = format_errors(@search)
    end
  end

  def prime_quadruplet
    if @search.valid?
      @prime_quadruplet = @search.prime_quadruplet
      @prime_quadruplet = Kaminari.paginate_array(@prime_quadruplet).page(params[:page]).per(500)
    else
    flash.now.alert  = format_errors(@search)
    end
  end

  def mersenne_number
  end

  def goldbachs_conjecture
  end

  def fermats_little_theorem
  end

  private
  def instance_search_form_get
    @search = SearchForm.new(params)
  end
end
