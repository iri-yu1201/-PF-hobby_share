class Post < ApplicationRecord

  attachment :photo

  belongs_to :user

end
