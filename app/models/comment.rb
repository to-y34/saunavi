class Comment < ApplicationRecord
    belongs_to   :user
    belongs_to   :review
    has_many     :likes,  dependent: :destroy
    
end
