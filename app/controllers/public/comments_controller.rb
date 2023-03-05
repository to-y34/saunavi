class Public::CommentsController < ApplicationController

def create
    @review = Review.find(params[:review_id])
    @comment= Comment.new(comment_params)
    @institution = Institution.find(params[:institution_id])
    @comment.review = @review
    @comment.user = current_user
    @comment.save
    redirect_to institution_review_path(@institution,@review)
end



private
def comment_params
   params.require(:comment).permit(:text)
end 

end


