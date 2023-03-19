class Public::LikesController < ApplicationController
 
 def create
     @review_like = Like.new(user_id: current_user.id, review_id: params[:review_id])
     @review_like.save!
     @institution = Institution.find(params[:institution_id])
     @review = Review.find(params[:review_id])
     redirect_to institution_review_path(@institution,@review)
 end
 def destroy
     @review_like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])
     @review_like.destroy
     @institution = Institution.find(params[:institution_id])
     @review = Review.find(params[:review_id])
     redirect_to institution_review_path(@institution,@review) 
 end

end


