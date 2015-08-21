class Topics::BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
    @bookmark.creator = current_user
    authorize @bookmark
    
    @bookmark.topic = @topic
    if @bookmark.save
      flash[:notice] = "Your bookmark was saved."
      redirect_to topics_path
    else
      redirect_to root
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Updated successfully."
      redirect_to @topic
    else
      redirect_to root
    end
  end
  
  #def destroy
   # @bookmark = Bookmark.find(params[:id])
    #if @bookmark.destroy
     # flash[:notice] = "Bookmark has been deleted."
      #redirect_to @topic
    #else
     # redirect_to root
    #end
  #end
  
end
