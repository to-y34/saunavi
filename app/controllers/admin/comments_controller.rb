class Admin::CommentsController < ApplicationController
   def destroy
    @review = Review.find(params[:review_id])    
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_review_path(@review)
   end
end
