class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :tag_bindings, dependent: :destroy
    has_many :tags, through: :tag_bindings
    has_many :comments, dependent: :destroy
end
