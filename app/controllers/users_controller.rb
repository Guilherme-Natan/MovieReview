class UsersController < ApplicationController
  before_action :require_signin, except: [ :new, :create ]
  before_action :require_correct_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User successfully created!"
      session[:user_id] = @user.id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to users_url, status: :see_other, alert: "Account successfully deleted!"
  end

  private

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to movies_url
    end
  end

  def user_params
    params.require(:user).permit("name", "email", "password", "password_confirmation")
  end
end
