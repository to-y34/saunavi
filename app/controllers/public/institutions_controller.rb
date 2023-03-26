class Public::InstitutionsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :area, :search, :show, :food, :trip]
  
  def new
    @institution = Institution.new
  end
  
  def create
    @institution = Institution.new(institution_params)
    @institution.user = current_user
    if @institution.save
      flash[:notice] = "施設を登録しました"
      redirect_to institutions_path
    else
      render :new
    end  
  end  

  def index
    @institutions = Institution.all
  end
  
  def area
    @institutions = Institution.where(area: params[:area])
  end  
  
  def search
  @section_title = "「#{params[:search]}」の検索結果"
  @institutions = if params[:search].present?
             Institution.where(['name LIKE ? OR address LIKE ?',
                        "%#{params[:search]}%", "%#{params[:search]}%"])
                 
  else
   Institution.none
  end
  end

  def show
    @institution = Institution.find(params[:id])
    @review = Review.new
    @reviews = @institution_Review
  end

  def food
    @institution = Institution.find(params[:institution_id])
    @review = Review.new
    @reviews = @institution_Review
  end  

  def trip
    @institution = Institution.find(params[:institution_id])
    @review = Review.new
    @reviews = @institution_Review
  end  

  def edit
    @institution = Institution.find(params[:id])
  end
  
  def update
    @institution = Institution.find(params[:id])
    if @institution.update(institution_params)
      flash[:notice] = "施設情報を編集しました"
    　redirect_to institution_path(@institution.id)
    else
      render :edit
    end  
  end
  
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy
    redirect_to institutions_path
  end  
  
  
  private
  def institution_params
   params.require(:institution).permit(:name, :address, :area, :link, :start_time, :finish_time, :price, :telephone_number, :introduction, images: [])
  end 
  
end
