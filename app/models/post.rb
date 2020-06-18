class Post < ApplicationRecord
  belongs_to :pet

  has_one_attached :upload
end
