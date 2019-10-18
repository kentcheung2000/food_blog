class UsersController < ApplicationController
  before_action :find_user
  before_action :authorize_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Welcome to Blog On Rails!"
      redirect_to outings_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update

    if @user.update edit_user_params
      flash[:success] = "Changes saved"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
    end

    redirect_to edit_user_path(@user)
  end

  private
  def find_user
    @user = User.find params[:id] if params[:id].present?
  end

  def edit_user_params
    params.require(:user).permit(:name, :email)
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end

end
