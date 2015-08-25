class UsersController < ApplicationController
  def show
    
    @user = current_user
    @user_bookmarks = Bookmark.where(creator_id: user.id)
    @liked_bookmarks = @user.liked_bookmarks
    
    
  end
end
