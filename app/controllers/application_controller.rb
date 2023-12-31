# frozen_string_literal: true
class ApplicationController < ActionController::API
  before_action :authenticate_request
  after_action :set_session
  attr_reader :current_user

  private def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  private def set_session
    session[:current_user] = @current_user if @current_user
  end

end
