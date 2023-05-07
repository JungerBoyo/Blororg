class User < ApplicationRecord
    has_one :attachment, as: :attachable
    has_many :posts
    has_many :comments
end
