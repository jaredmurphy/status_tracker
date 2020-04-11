class DashboardFacade
  attr_reader :username

  def initialize(user)
    @user = user
    @username = user.username
    @following = user.following
  end

  def current_statuses
    following.map { |user| Status.current(user) }
  end

  private

  attr_reader :user, :following

end
