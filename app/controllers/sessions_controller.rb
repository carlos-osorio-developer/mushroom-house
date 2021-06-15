class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      log_in user
      redirect_back_or root_path
    else
      redirect_to login_path, alert: 'User do not exist'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
