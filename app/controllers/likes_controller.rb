class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])

    like = current_user.likes.create(bookmark: @bookmark)
    if like.valid?
      flash[:notice] = "Liked bookmark"
      redirect_to bookmarks_path
    else
      flash[:error] = "Unable to like. Please try again."
      redirect_to bookmarks_path
    end
  end

  def destroy
  
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

  if @like.destroy
    flash[:notice] = "Unliked"
    redirect_to [@bookmark]
  else
    flash[:error] = "Unable to remove like. Please try again."
    redirect_to [@bookmark]
  end
end

end
