# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :detail
      t.string :photo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
