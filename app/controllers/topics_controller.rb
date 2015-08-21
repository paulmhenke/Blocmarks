class TopicsController < ApplicationController
  def index
    @user = current_user
    #@topics = Topic.where(user_id: current_user)
    @topics = Topic.all
    
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)  
    if @topic.save 
      flash[:notice] = "Topic created succesfully." 
      redirect_to topics_path
    else
      redirect_to root
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      redirect_to root
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "Topic was deleted."
      redirect_to topics_path
    else
      redirect_to root
    end
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
  
end
