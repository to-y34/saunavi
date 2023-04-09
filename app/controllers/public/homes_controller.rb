class Public::HomesController < ApplicationController
  def top
    @institutions = Institution.find(Bookmark.group(:institution_id).order('count(institution_id) desc').limit(3).pluck(:institution_id))
    @reviews = Review.all
    @reviews = Review.all.order(created_at: :desc)
    @review_3 = @reviews.first(3)
  end

  def about
  end
end
