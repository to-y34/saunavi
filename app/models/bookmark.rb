class Bookmark < ApplicationRecord
    belongs_to   :institution
    belongs_to   :user
end
