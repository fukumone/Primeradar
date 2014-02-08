class TopController < ApplicationController

  def index
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      if params[:prime_number].present?
        @prime = params[:prime_number].to_i
      end
    else
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
      render "index"
    end
  end

  def search_prime
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      @search_range = PrimeNumber.search_range_prime(params)
      render "index"
    else
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
      render "index"
    end
  end

  def search_twins_prime
    @search_form = PrimeNumberSearchForm.new(params)
    if @search_form.valid?
      @search_twins_range = PrimeNumber.search_twins_range_prime(params)
      render "index"
    else
      flash.now.alert  = @search_form.errors.full_messages.join('<br />').html_safe
      render "index"
    end
  end

end
