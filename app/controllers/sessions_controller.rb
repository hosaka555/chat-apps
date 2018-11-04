class SessionsController < ApplicationController
  skip_before_action :require_login, expect: :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(params[:user][:email], params[:user][:password])
    if @user
      redirect_back_or_to(root_path)
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
