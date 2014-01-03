class TopController < ApplicationController

  def index
    if params[:prime_number].present?
      @prime = params[:prime_number].to_i
    end
  end

  def search
  end

end
