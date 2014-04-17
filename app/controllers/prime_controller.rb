class PrimeController < ApplicationController

  def introduction_prime
  end

  def history_prime
  end

  def twins_prime
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      @search_twins_range = PrimeNumber.search_twins_range_prime(params[:twins_prime_number_from], params[:twins_prime_number_to])
      @search_twins_range = Kaminari.paginate_array(@search_twins_range).page(params[:page]).per(1000)
    else
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
    end
  end

  def largest_prime
  end

  def prime_triplet
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      @search_prime_triplet = PrimeNumber.search_prime_triplet(params[:prime_triplet_from], params[:prime_triplet_to])
      @search_prime_triplet = Kaminari.paginate_array(@search_prime_triplet).page(params[:page]).per(500)
    else
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
    end
  end

  def prime_quadruplet
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      @search_prime_quadruplet = PrimeNumber.search_prime_quadruplet(params[:prime_quadruplet_from], params[:prime_quadruplet_to])
      @search_prime_quadruplet = Kaminari.paginate_array(@search_prime_quadruplet).page(params[:page]).per(500)
    else
    flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
    end
  end

  def mersenne_number
  end

  def goldbachs_conjecture
  end

  def fermats_little_theorem
  end

end
