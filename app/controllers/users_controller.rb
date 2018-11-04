class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login @user
      redirect_to mypage_path(@user.user_name)
      flash[:success]  = "ユーザーを登録しました"
    else
      render :new
      flash.now[:danger] = "ユーザー登録に失敗しました"
    end
  end

  private
  def user_params
    params.require(:user).permit(
                             :user_name,
                             :email,
                             :password,
                             :password_confirmation
    )
  end
end
