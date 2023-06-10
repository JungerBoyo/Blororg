require 'bcrypt'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :posts
  has_many :comments
  has_one_attached :avatar

  validates :avatar, file_size: { less_than_or_equal_to: 10.kilobytes }, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  def set_post_password(password)
    self.update(post_password_digest: BCrypt::Password.create(password))
  end

  def authenticate_post_password(password)
    password_digest = BCrypt::Password.create(password)
    password_digest == self.post_password_digest 
  end

  private
    def set_default_role
      self.role ||= :user
    end
end
