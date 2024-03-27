class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :review, presence: true, length: {maximum: 200}
end
