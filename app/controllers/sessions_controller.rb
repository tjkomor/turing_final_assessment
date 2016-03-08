class SessionsController < ApplicationController

  def new
  end

  def create
    if valid_user?
      session[:user_id] = @user.id
      redirect_to task_lists_path
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def valid_user?
    @user = User.find_by(email: session_params[:email])
    @user && @user.authenticate(session_params[:password])
  end
end
