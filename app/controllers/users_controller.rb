class UsersController < ApplicationController
  def show
    @user = current_user
    @topics = @user.topics
  end
end
