class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError do |exception|
    # redirect_to root_url, alert: exception.message
    redirect_to root_url, alert: "You don't have permission to do that"
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
