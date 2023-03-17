class Institution < ApplicationRecord
    belongs_to  :user
    has_many    :reviews,   dependent: :destroy
    has_many    :bookmarks,   dependent: :destroy
   
   def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
   end
   
   def avg_score
    unless self.reviews.empty?
      reviews.average(:star_id).round(1)
    else
      0.0
    end
   end

  def avg_score_percentage
   unless self.reviews.empty?
     reviews.average(:star_id).round(1).to_f*100/5
   else
     0.0
   end
  end
    
     has_many_attached :images
    
    enum area: { hokkaido:0, aomori:1, iwate:2, miyagi:3, akita:4, yamagata:5, hukusima:6, ibaraki:7, tochigi:8, gunma:9, saitama:10, tiba:11, tokyo:12, kanagawa:13, niigata:14, toyama:15, isikawa:16, hukui:17, yamanasi:18, nagano:19, gifu:20, sizuoka:21, aichi:22, mie:23, siga:24, kyoto:25, oosaka:26, hyogo:27, nara:28, wakayama:29, tottori:30, simane:31, okayama:32, hirosima:33, yamaguti:34, tokusima:35, kagawa:36, ehime:37, kouti:38, hukuoka:39, saga:40, nagasaki:41, kumamoto:42, ooita:43, miyazaki:44, kagosima:45, okinawa:46 } 
end
