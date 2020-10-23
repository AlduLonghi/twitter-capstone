class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :opinion_id

      t.timestamps
    end
    add_foreign_key :favorites, :users, column: :user_id
    add_foreign_key :favorites, :opinions, column: :opinion_id
  end
end
