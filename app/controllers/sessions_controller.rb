class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "你已經成功登入"
      redirect_to root_path
    else
      flash.now[:error] = "名稱或密碼有誤"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "你已經成功登出"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "您已經登入"
      redirect_to root_path
    end
  end

end
