class Admin::InstitutionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @institutions = Institution.all
  end

  def show
    @institution = Institution.find(params[:id])
  end
  
  def edit
    @institution = Institution.find(params[:id])
  end
  
  def update
    @institution = Institution.find(params[:id])
    if @institution.update(institution_params)
     flash[:notice] = "施設情報を編集しました"
     redirect_to admin_institution_path(@institution.id)
    else
     render :edit
    end  
  end
  
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to admin_institutions_path
  end  
  
  private
  def institution_params
   params.require(:institution).permit(:name, :address, :area, :link, :start_time, :finish_time, :price, :telephone_number, :introduction, images: [])
  end 
end
