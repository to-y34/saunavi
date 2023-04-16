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
         
         has_one_attached :profile_image
         
         validates :nickname, presence: true
         validates :age, presence: true
         validates :sex, presence: true
      
         # プロフィール画像
    def get_profile_image(width, height)
     unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
     profile_image.variant(resize_to_limit: [width, height]).processed
    end
  
  # ゲストログイン
  def self.guest
      find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
      user.age = "20"
      user.introduction = "no"
    end
  end
         
         enum sex: { man: 0, woman: 1}
end
