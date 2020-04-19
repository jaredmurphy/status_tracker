module UserAuth
  class AuthenticationError < StandardError; end

  attr_reader :current_user

  def authenticate_user!
    set_current_user
  end

  def set_current_user
    @current_user = current_user
  end

  def current_user
    @current_user ||= begin
                        user_id = session[:user_id]
                        User.find(user_id) if user_id.present?
                      end
  end

  def current_user=(user)
    @current_user = user
  end

  def auto_login(user)
    session[:user_id] = user.id.to_s
    @current_user = user
  end
end
