class ApplicationController < ActionController::Base
  include ErrorsHelper
  protect_from_forgery with: :exception

  rescue_from Exception, with: :rescue500 #if Rails.env.production?
  rescue_from ActionController::RoutingError, with: :rescue404 if Rails.env.production?

  private
  def form
    @search_form = PrimeNumberSearchForm.new(params)
  end

  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
    # ErrorMailer.internal_server_error(@exception, request).deliver
  end

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end
end
