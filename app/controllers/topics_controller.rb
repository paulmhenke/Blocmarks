class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = @user.topics
    @topic = Topics.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def show
  end

  def new
  end

  def edit
  end
end
