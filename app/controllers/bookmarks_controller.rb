class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end
  
  def create
    
    
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
