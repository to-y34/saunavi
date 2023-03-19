class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @institution = Institution.find(params[:institution_id])
  end
  
  def create
    @institution = Institution.find(params[:institution_id])
    @review= Review.new(review_params)
    @review.institution = @institution
    @review.user = current_user
    @review.save!
    redirect_to institution_review_path(@institution,@review)
  end

  def show
    @review = Review.find(params[:id])
    @institution = Institution.find(params[:institution_id])
    @comment = Comment.new
  end
  
  def edit
  end 
  
  def update
  end
    
  
  def destroy
    @institution = Institution.find(params[:institution_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to institutions_path(@institution)
  end
  
  private
  def review_params
   params.require(:review).permit(:title, :star, :content, :date, :food_name, :food_address, :food_comment, :trip_name, :trip_address, :trip_comment, :image, :food_image, :trip_image)
  end 
end
