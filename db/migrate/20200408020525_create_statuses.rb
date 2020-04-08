class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :do_not_disturb
      t.string :text

      t.timestamps
    end
  end
end
