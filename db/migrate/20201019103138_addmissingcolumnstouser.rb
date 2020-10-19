class Addmissingcolumnstouser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_pic, :string
    add_column :users, :cover_img, :string
  end
end
