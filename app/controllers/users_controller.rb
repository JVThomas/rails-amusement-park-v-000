class UsersController < ApplicationController

  before_action :set_user, only:[:show,:edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome to the theme park!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    redirect_to user_path(current_user) if @user == current_user
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user == @user
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(current_user), notice: "You are not authorized to do that"
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :height,:happiness,:nausea,:tickets,:admin, :user_id)
    end
end