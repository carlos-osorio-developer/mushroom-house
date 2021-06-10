class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def logged_in_user
      unless logged_in?    
        redirect_to login_path, alert: "Please log in."
      end
  end
end
