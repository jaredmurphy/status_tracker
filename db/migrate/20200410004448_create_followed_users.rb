class CreateFollowedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :followed_users do |t|
      t.integer :follower_id, null: false
      t.integer :following_id, null: false
      t.integer :status, null: false

      t.timestamps null: false
    end

    add_index :followed_users, :following_id
    add_index :followed_users, :follower_id
    add_index :followed_users, [:following_id, :follower_id], unique: true
  end
end
