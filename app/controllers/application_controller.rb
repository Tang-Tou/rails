class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_user, :user_sign_in?
  #可作為helper被讀取再匯出給 view 使用

  private
    def not_found
      render file: "#{Rails.root}/public/404.html",
             status: 404
    end

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

    def check_user!
      redirect_to root_path if not user_sign_in?
    end
end
