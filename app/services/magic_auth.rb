class MagicAuth
  attr_reader :errors

  def initialize(email:)
    @email = email
    @success = false
  end

  def login!
    if existing_user?
      update_user!
      LoginMailer.send_email(user, url).deliver_later
      @success = true
    else
      @errors = ["Email invalid"]
    end
  end

  def success?
    success
  end

  private

  attr_reader :email
  attr_accessor :success

  def existing_user?
    user.present?
  end

  def user
    @user ||= User.find_by(email: email)
  end

  def update_user!
    user.update!(
      login_token: SecureRandom.urlsafe_base64,
      login_token_valid_until: Time.zone.now + 15.minutes)
  end

  def url
    #extension = Rails.application.routes.url_helpers.sessions_path(login_token: user.login_token)

    #"#{base}/#{extension}"
    url_options = { host: "localhost:3000" }
    Rails.application.routes.url_helpers.sessions_url(login_token: user.login_token, **url_options)
  end

end

