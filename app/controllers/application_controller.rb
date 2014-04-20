class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, with: :rescue500
  rescue_from ActionController::RoutingError, with: :rescue404

  private
  def form
    @search_form = PrimeNumberSearchForm.new(params)
  end

  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end
end
