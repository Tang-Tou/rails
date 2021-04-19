module SessionsHelper
  def current_user
    User.find_by(id: session[ENV['session_name']])
  end

  def user_sign_in?
    if session[ENV['session_name']]
      return true
    else
      return false
    end
  end
end
