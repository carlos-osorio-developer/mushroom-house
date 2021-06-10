class SessionsController < ApplicationController
def new
end

def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
    log_in user
    redirect_back_or user
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
end

def destroy
    log_out
    redirect_to root_url
end
end