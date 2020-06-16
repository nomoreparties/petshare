class Post < ApplicationRecord
  belongs_to :pet

  has_many_attached :uploads
end
