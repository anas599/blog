class Posts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :user }
      t.string :title
      t.string :text
      t.string :content
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps
    end

    add_index :posts, :title, unique: true
  end
end
