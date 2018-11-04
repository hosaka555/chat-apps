class SessionsController < ApplicationController
  skip_before_action :require_login, expect: :destroy

  def new
    binding.pry
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "ログインしました"
      redirect_back_or_to mypage_path(@user.user_name)
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
