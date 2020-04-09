class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      flash[:success] = "Nice status bro"
      redirect_to status_path(@status)
    else
      flash[:error] = @status.errors.full_messages
      render :new
    end
  end

  private

  def status_params
    params.require(:status).permit(:text, :user_id, :do_not_disturb)
  end
end
