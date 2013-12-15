class BookmarksController < ApplicationController

require 'will_paginate/array'

  def index
    if params[:tag]
      @bookmarks = Bookmark.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 10)
    else
      @bookmarks = Bookmark.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end


  def new
    @bookmark = Bookmark.new
    authorize! :create, @bookmark, message: "You need to be a member to create a new bookmark."
  end

  def create
  @bookmark = Bookmark.new(params[:bookmark])
  
  if @bookmark.save
    UserBookmark.create(user_id: current_user.id, bookmark_id: @bookmark.id)
    flash[:notice] = "Bookmark was saved."
    redirect_to @bookmark
  else
    flash[:error] = "There was an error saving the bookmark. Please try again."
    render :new
  end
end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize! :edit, @bookmark, message: "You need to own the bookmark to edit it."
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize! :update, @bookmark, message: "You need to own the bookmark to edit it."
    if @bookmark.update_attributes(params[:bookmark])
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def mybookmarks 
    if params[:tag]
      @bookmarks = current_user.bookmarks.tagged_with(params[:tag])
    else
      @bookmarks = current_user.bookmarks
    end  
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    name = @bookmark.name
     authorize! :destroy, @bookmark, message: "You need to own the bookmark to delete it."
    if @bookmark.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
