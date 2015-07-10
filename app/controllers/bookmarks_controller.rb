class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(params.require(:boomark).permit(:url))
    @bookmark.topic = @topic
    if @bookmark.save
      flash[:notice] = "Your bookmark was saved."
      redirect_to @topic
    else
      redirect_to root
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Updated successfully."
      redirect_to @topic
    else
      redirect_to root
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark has been deleted."
      redirect_to @topic
    else
      redirect_to root
    end
  end
  
end
