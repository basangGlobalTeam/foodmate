class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intro, :string, null: true, default: ""
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :address, :string, null: false, default: ""
    add_column :users, :longitude, :float, null: true
    add_column :users, :latitude, :float, null: true
    add_column :users, :sex, :integer, default: 0
    add_column :users, :avatar, :string, null: true, default: ""
    add_column :users, :cover, :string, null: true, default: ""
    add_column :users, :date_of_birth, :date, null: true
    add_index :users, [:address, :name, :latitude, :longitude]
  end
end
