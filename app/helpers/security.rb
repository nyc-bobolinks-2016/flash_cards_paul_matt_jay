def is_authenticated?
  return true if session[:user_id]
end

def current_user
  if is_authenticated?
    @user = User.find_by_id(session[:user_id])
  end
end
