class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :rescue500
  rescue_from ActionController::RoutingError, with: :rescue404

  private
  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end
end
