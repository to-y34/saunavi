class Public::BookmarksController < ApplicationController
   before_action :authenticate_user!
  
    def create
    @institution = Institution.find(params[:institution_id])
    bookmark = @institution.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      flash[:notice] = "お気に入りに登録しました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
    end

  def destroy
    @institution = Institution.find(params[:institution_id])
    bookmark = @institution.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
