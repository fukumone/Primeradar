class PrimeController < ApplicationController

  def introduction_prime
  end

  def history_prime
  end

  def twins_prime
  end

  def largest_prime
  end

  def prime_triplet
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.invalid?
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
    end
  end

  def prime_quadruplet
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.invalid?
    flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
    end
  end
end
