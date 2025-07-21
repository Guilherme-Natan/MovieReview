class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

private

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    user == current_user
  end

  helper_method :current_user?

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end
end
