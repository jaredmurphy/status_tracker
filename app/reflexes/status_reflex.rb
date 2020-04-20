# frozen_string_literal: true

class StatusReflex < ApplicationReflex
  def update_form
    @status = Status.new(**current_values, element[:label] => element[:value])
  end

  private

  def current_values
    JSON.parse(element.dataset["status"]).symbolize_keys
  end
end
