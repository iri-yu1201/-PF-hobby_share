class RenamePhotoColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :photo, :photo_id
  end
end
