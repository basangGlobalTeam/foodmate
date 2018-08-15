class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :post_id
      t.string :file, null: true, default: ''
      t.timestamps
    end
  end
end
