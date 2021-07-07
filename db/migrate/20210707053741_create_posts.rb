class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.text :detail, null: false
      t.string :photo
    #外部キー制約
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
