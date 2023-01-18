class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :likes, as: :likeable
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    
    has_one_attached :avatar
end
