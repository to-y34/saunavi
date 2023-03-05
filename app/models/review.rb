class Review < ApplicationRecord
    belongs_to   :user
    belongs_to   :institution
    has_many     :comments,   dependent: :destroy
   
end
