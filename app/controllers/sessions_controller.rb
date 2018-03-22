class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by(name: user_params[:name])
    if @user
      set_session(@user.id)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id if !session[:user_id].nil?
    redirect_to root_path
  end
end
