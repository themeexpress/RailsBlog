class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged In"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Username or password is not correct"
      render :new
    end
    #debugger
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Logout"
    redirect_to root_path
  end
  
end