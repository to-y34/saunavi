class Review < ApplicationRecord
    belongs_to   :user
    belongs_to   :institution
    has_many     :likes,  dependent: :destroy
    has_many     :comments,   dependent: :destroy
    
    has_one_attached :image
    has_one_attached :food_image
    has_one_attached :trip_image
    
    validates :title, presence: true
    validates :star, presence: true
    validates :date, presence: true
    
    def liked?(user)
     likes.where(user_id: user.id).exists?
    end
    
     validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
   
end
