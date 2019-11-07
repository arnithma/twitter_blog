class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :strings
  end
end
