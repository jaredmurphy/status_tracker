class StatusesController < ApplicationController
  before_action :authenticate_user!

  def index
    @status ||= Status.new(user_id: current_user.id)
    @statuses = current_user.statuses.order("created_at DESC").limit(10)
  end

  def new
    @status = Status.new(user_id: current_user.id)
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      flash[:success] = "Nice status bro"
      redirect_to statuses_path
    else
      flash[:alert] = @status.errors.full_messages.first
      render :index
    end
  end

  private

  def status_params
    params.require(:status).permit(:text, :user_id, :do_not_disturb)
  end
end
