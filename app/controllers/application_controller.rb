class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  #||= 的意思是指如果 @current_user沒有值的話，右邊的值就會給@current_user
  end

  def logged_in?
    !!current_user     # !!的意思是強制將資料的值轉為相對應的boolean值
  end

  def require_user
    if !logged_in?
      flash[:error] = "你必須要登入"
      redirect_to login_path
    end
  end
end
