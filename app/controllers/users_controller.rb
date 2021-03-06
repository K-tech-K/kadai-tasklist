class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :show, :update, :destroy]

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'ユーザを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:success] = "ユーザーは正常に削除されました"
    redirect_to root_url
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end