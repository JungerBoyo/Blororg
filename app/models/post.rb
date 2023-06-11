class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tag_bindings, dependent: :destroy
  has_many :tags, through: :tag_bindings
  has_many :comments, dependent: :destroy
  has_many_attached :images

    
  validates :images, file_size: { less_than_or_equal_to: 256.kilobytes }, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }
end
