class LikesController < ApplicationController
  
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    
    if like.save
      flash[:success] = "You've liked this bookmark"
      redirect_to topics_path
    else
      flash[:danger] = "There was a problem. Try again."
      redirect_to topics_path
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like
    
    if like.destroy
      flash[:success] = "You've unliked this bookmark"
      redirect_to topics_path
    else
      flash[:danger] = "There was an error, try again"
      redirect_to topics_path
    end
  end
end
