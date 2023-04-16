class Admin::CommentsController < ApplicationController
   def destroy
    @review = Review.find(params[:id])    
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_review_path(@review)
   end
end
