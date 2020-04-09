class AddDefaultDoNotDisturbToStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :statuses, :do_not_disturb, :boolean, default: false
  end
end
