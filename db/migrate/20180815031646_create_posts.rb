class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content, null: true, default: ''
      t.string :restaurant, null: true, default: ''
      t.float :longitude, null: true
      t.float :latitude, null: true
      t.string :address, null: true, default: ''
      t.timestamps
    end
    add_index :posts, [:address, :latitude, :longitude]
  end
end
