class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.full_name}!"
      redirect_to outings_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Signed out!'
    redirect_to root_path
  end
  
end
