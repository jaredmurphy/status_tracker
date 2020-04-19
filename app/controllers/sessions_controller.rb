class SessionsController < ApplicationController
  def create
    # we don't log in the user if a login token has expired

    #user = user_by_login_token(params[:login_token])
    user = User.where(login_token: params[:login_token])
      .where('login_token_valid_until > ?', Time.now).first


    if user
      # nullify the login token so it can't be used again
      user.update!(login_token: nil, login_token_valid_until: nil)

      # sorcery helper which logins the user
      auto_login(user)

      redirect_to root_path, notice: 'Signed in successfully'
    else
      redirect_to root_path, alert: 'Invalid link'
    end
  end

  def destroy
    logout

    redirect_to root_path, notice: 'You are signed out'
  end

  private

  #def auto_login(user)
    #session[:user_id] = user.id.to_s
    #@current_user = user
  #end

  def logout
    return unless logged_in?

    @current_user = nil
    reset_session
  end

  def logged_in?
    !!current_user
  end

  #def current_user

    #@current_user ||=
    #unless defined?(@current_user)
      #@current_user = login_from_session || login_from_other_sources || nil
    #end

    #@current_user
  #end

  #def current_user=(user)
    #@current_user = user
  #end

end

