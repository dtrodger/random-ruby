helpers do
  def auth_user
    @auth_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    true if auth_user
  end
end