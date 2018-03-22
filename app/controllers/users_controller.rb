class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit, :update]
  before_action :require_login, only: [:show]

  def index
  end

  def show
    redirect_to root_path unless current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    set_session(@user.id)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

end
