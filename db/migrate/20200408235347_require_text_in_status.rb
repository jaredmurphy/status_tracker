class RequireTextInStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :statuses, :text, :string, null: :false
  end
end
