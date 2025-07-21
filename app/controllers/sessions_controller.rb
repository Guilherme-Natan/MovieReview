class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user), notice: "Welcome back, #{user.name}!"
    else
      flash.now.alert = "Email or password incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to movies_path, status: :see_other, notice: "Successfully logged out!"
  end
end
