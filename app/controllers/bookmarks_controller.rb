class BookmarksController < ApplicationController
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark Removed."
    else
      flash[:danger] = "Error"
    end
    
    respond_to do |format|
      format.html
      format.js { render 'destroy.js.erb' }
    end
  end
  
end