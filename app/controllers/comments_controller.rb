class CommentsController < ApplicationController
  before_action :find_app
  
  def create
    @comment = @app.comments.create(params[:comment].permit(:content))
    @comment.app_id = @app.id
    @comment.save
    
    if @comment.save
      redirect_to app_path(@app)
    else
      render 'new'
    end  
  end
  
  private
    def find_app
      @app=App.find(params[:app_id])
    end
  
end