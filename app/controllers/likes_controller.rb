class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])

    like = current_user.likes.create(bookmark: @bookmark)
    if like.valid?
      flash[:notice] = "Liked bookmark"
      redirect_to bookmarks_path
      UserBookmark.create(user_id: current_user.id, bookmark_id: @bookmark.id)
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
    redirect_to bookmarks_path
  else
    flash[:error] = "Unable to remove like. Please try again."
    redirect_to bookmarks_path
  end
end

end
