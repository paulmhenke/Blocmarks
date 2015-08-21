class LikesController < ApplicationController
  
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save
      flash[:success] = "You've liked this bookmark"
    else
      flash[:danger] = "There was a problem. Try again."
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    
    if like.destroy
      flash[:success] = "You've unliked this bookmark"
      #redirect_to @bookmark
    else
      flash[:danger] = "There was an error, try again"
      #redirect_to @bookmark
    end
  end
end
