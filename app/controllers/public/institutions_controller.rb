class Public::InstitutionsController < ApplicationController
  def new
    @institution = Institution.new
  end
  
  def create
    @institution = Institution.new(institution_params)
    @institution.user = current_user
    @institution.save
    redirect_to institutions_path
  end  

  def index
    @institutions = Institution.all
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
  end

  def edit
    @institution = Institution.find(params[:id])
  end
  
  def update
    @institution = Institution.find(params[:id])
    @institution.update(institution_params)
    redirect_to institution_path(@institution.id)
  end
  
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy
    redirect_to institutions_path
  end  
  
  
  private
  def institution_params
   params.require(:institution).permit(:name, :address, :area, :link, :start_time, :finish_time, :price, :telephone_number, :introduction, :image)
  end 
  
end
