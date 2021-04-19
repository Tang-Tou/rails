class SessionsController < ApplicationController
  def new
    @user = User.new
  end
    
  def create
    # email = user_params[:email]
    # password = user_params[:password]
    user = User.login(user_params)
    if user
      #發號碼牌
      #會拿這個號碼牌做驗證
      session[ENV['session_name']] = user.id
      
      
      #轉去首頁
      redirect_to root_path
    else
      redirect_to sign_in_sessions_path
    end
  end

  def destroy
    # 登出 讓號碼牌失效
    session[ENV['session_name']] = nil
    # 轉址
    redirect_to root_path
  end 
    
    private 
    def user_params
      params.require(:user).permit(:email, :password)
    end

  
  end
  