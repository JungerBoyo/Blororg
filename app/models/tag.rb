class Tag < ApplicationRecord
    has_many :tag_bindings, dependent: :destroy
    has_many :posts, through: :tag_bindings
end
