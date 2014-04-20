class TopController < ApplicationController
  before_action :form

  def index
    if @search_form.valid?
      if params[:prime_number].present?
        @prime = params[:prime_number].to_i
      end
    else
      flash.now.alert  = format_errors(@search_form)
      render "index"
    end
  end

  def search_prime
    if @search_form.valid?
      @search_range = PrimeNumber.search_range_prime(params[:prime_number_from], params[:prime_number_to])
      @search_range = Kaminari.paginate_array(@search_range).page(params[:page]).per(2000)
      render "index"
    else
      flash.now.alert  = format_errors(@search_form)
      render "index"
    end
  end

  def search_twins_prime
    if @search_form.valid?
      @search_twins_range = PrimeNumber.search_twins_range_prime(params[:twins_prime_number_from], params[:twins_prime_number_to])
      @search_twins_range = Kaminari.paginate_array(@search_twins_range).page(params[:page]).per(1000)
      render "index"
    else
      flash.now.alert  = format_errors(@search_form)
      render "index"
    end
  end

  def routing_error
    raise ActionController::RoutingError,
    "No route matches #{request.path.inspect}"
  end
end
