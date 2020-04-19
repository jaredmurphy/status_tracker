class DashboardController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @dashboard = {}
  end
end
