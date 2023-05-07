class Post < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :attachments, as: attachable,
  has_many :tags
  has_many :comments
end
