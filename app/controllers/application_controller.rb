class ApplicationController < ActionController::Base
  include UserAuth

  add_flash_types :success, :error


end
