class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile_pic
    remove_column :users, :cover_img
  end
end
