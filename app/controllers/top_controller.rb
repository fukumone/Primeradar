class TopController < ApplicationController
  def index
  end

  def search
    @search = SearchForm.new(params)
    render 'index'
  end

  def search_prime
    @search = SearchForm.new(params)
    if @search.valid?
      @range_prime = @search.range_prime
      @range_prime = Kaminari.paginate_array(@range_prime).page(params[:page]).per(2000)
      render 'index'
    else
      flash.now.alert  = format_errors(@search)
      render 'index'
    end
  end

  def search_twins_prime
    @search = SearchForm.new(params)
    if @search.valid?
      @twins_prime = @search.twins_range_prime
      @twins_prime = Kaminari.paginate_array(@twins_prime).page(params[:page]).per(1000)
      render 'index'
    else
      flash.now.alert  = format_errors(@search)
      render 'index'
    end
  end

  def routing_error
    raise ActionController::RoutingError,
    "No route matches #{request.path.inspect}"
  end
end
