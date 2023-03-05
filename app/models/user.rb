class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many    :institutions,   dependent: :destroy
         has_many    :bookmarks,   dependent: :destroy
         has_many    :comments,   dependent: :destroy
         has_many    :likes,   dependent: :destroy
         has_many    :reviews,   dependent: :destroy
         
         has_one_attached :image
         
         enum sex: { man: 0, woman: 1}
end
