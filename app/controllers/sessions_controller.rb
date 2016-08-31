class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.user_id
      redirect_to root_path, :notice => 'You have logged in successfully'
    else
      flash.now[:alert] = 'Invalid login/password combination'
      render :action => 'new'
    end
  end
  def destroy
    reset_session
    redirect_to root_path, :notice => 'You have successfully logged out'
  end
end
