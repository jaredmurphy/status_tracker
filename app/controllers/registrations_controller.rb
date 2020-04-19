class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(registration_params)

    if user.save
      magic_auth = MagicAuth.new(email: user.email)
      magic_auth.login!

      if magic_auth.success?
          message = { notice: "Registration complete! Check your email at #{registration_params[:email]} for a login link. Clicking that link will give you access to your account" }
      else
        alert = magic_auth.errors.first
        message = { alert: alert }
      end
    else
      alert = user.errors.full_messages.first
      message = { alert: alert }
    end

    redirect_to new_registrations_path, message
  end

  private

  def registration_params
    params.require(:user).permit(:email, :username)
  end
end
