class CreatePostsFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_foods do |t|
      t.references :food, foreign_key: true
      t.references :post, foreign_key: true
    end
  end
end
