class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name, null: true, default: ''
      t.timestamps
    end
    add_index :foods, [:name]
  end
end
