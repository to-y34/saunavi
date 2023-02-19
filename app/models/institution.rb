class Institution < ApplicationRecord
    belongs_to  :user
    has_many    :reviews,   dependent: :destroy
    has_many    :bookmarks, dependent: :destroy
end
