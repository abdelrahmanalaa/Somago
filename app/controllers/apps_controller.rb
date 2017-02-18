class AppsController < ApplicationController
  before_action :require_admin, except: [:show , :index]

  def index
    @apps = App.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @app = App.new
  end
  
  def create
    @app = App.new(app_params)
    if @app.save
      flash[:success] = "Application was added successfully"
      redirect_to apps_path
      
    else
      render 'new'
    end
  end
  
  def show
    @app = App.find(params[:id])
  
  end
  
  def edit
    @app = App.find(params[:id])
  end
  
  def update
    @app = App.find(params[:id])
    if @app.update(app_params)
    flash[:success] = "Application was successfully updated"
    redirect_to app_path(@app)
    else
      render 'edit'
    end
    
  
  end
  
  private
  
  def app_params 
    params.require(:app).permit(:name)
  end
  
  def require_admin
        if  !current_admin
          flash[:danger] = "only admin can perform this action"
          redirect_to apps_path
        end
  end  
end