class UsersController < ApplicationController
  def show
    
    @user = current_user
    @user_bookmarks = Bookmark.where(creator_id: @user.id) #? even though I don't use these in views, acceptable to put them here
    @liked_bookmarks = @user.liked_bookmarks
    @user_bookmark_topics = @user_bookmarks.group_by { |ubm| ubm.topic }
    @liked_bookmark_topics = @liked_bookmarks.group_by { |lbm| lbm.topic }
    
  end
end
