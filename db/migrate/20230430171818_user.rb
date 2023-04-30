class User < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :posts_counter
      t.timestamps
    end
    add_index :user, :name, unique: true
  end
end
