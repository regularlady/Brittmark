class BookmarksController < ApplicationController

  def index
    if params[:tag]
      @bookmarks = Bookmark.tagged_with(params[:tag])
    else
      @bookmarks = Bookmark.all
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end


  def new
    @bookmark = Bookmark.new
    authorize! :create, @bookmark, message: "You need to be a member to create a new bookmark."
    if @bookmark.save
  end

  def create
  @bookmark = current_user.bookmarks.build(params[:bookmark])
  
  if @bookmark.save
    flash[:notice] = "Bookmark was saved."
    redirect_to @bookmark
  else
    flash[:error] = "There was an error saving the bookmark. Please try again."
    render :new
  end
end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize! :edit, @bookmark, message: "You need to own the post to edit it."
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize! :update, @bookmark, message: "You need to own the post to edit it."
    if @bookmark.update_attributes(params[:post])
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end
end
