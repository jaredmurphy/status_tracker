class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    magic_auth = MagicAuth.new(email: login_params[:email])
    magic_auth.login!

    if magic_auth.success?
        redirect_to new_logins_path, notice: "Registration complete! Check your email at #{login_params[:email]} for a login link. Clicking that link will give you access to your account"
    else
      @user = User.new(email: login_params[:email])
      flash[:alert] = magic_auth.errors.first
      render :new
    end
  end

  private

  def login_params
    params.require(:user).permit(:email)
  end
end

