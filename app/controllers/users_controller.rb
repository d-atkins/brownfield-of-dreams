class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      UserMailer.registration_confirmation(user).deliver
      flash[:success] = "Logged in as #{user.first_name} #{user.last_name}."
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      @user = User.new
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
