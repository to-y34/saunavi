class Public::CommentsController < ApplicationController
 before_action :authenticate_user!
  def create
    @review = Review.find(params[:review_id])
    @comment= Comment.new(comment_params)
    @institution = Institution.find(params[:institution_id])
    @comment.review = @review
    @comment.user = current_user
    @comment.save
    flash[:notice] = "コメントしました"
    redirect_to institution_review_path(@institution,@review)
  end
  
  def destroy
    @review = Review.find(params[:review_id])
    @institution = Institution.find(params[:institution_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to institution_review_path(@institution,@review)
  end

private
def comment_params
   params.require(:comment).permit(:text)
end 

end


