class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = Topics.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
