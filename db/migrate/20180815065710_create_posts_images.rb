class CreatePostsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_images do |t|
      t.references :image, foreign_key: true
      t.references :post, foreign_key: true
    end
  end
end
