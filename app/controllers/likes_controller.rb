class LikesController < ApplicationController

  def create
    @bookmark = @bookmarks.find(params[:bookmark_id])

    like = current_user.likes.create(bookmark: @bookmark)
    if like.valid?
      flash[:notice] = "Liked bookmark"
      redirect_to [@bookmark]
    else
      flash[:error] = "Unable to like. Please try again."
      redirect_to [@bookmark]
    end
  end

  def destroy
  
    @bookmark = @bookmark.find(params[:bookmark_id])
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
