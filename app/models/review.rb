class Review < ApplicationRecord
    belongs_to   :user
    has_many     :comments,   dependent: :destroy
    has_many     :likes,      dependent: :destory
end
