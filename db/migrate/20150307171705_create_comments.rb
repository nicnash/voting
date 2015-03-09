class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :idea_id

      t.timestamps null: false

      add_foreign_key :comments, :users
    end
  end
end
