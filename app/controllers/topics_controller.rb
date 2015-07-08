class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end
  
  def create
  end

  def edit
  end
  
  def update
  end
end
