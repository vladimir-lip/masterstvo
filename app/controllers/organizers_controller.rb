class OrganizersController < ApplicationController

  before_action :org_find,    only: [:show, :edit, :destroy, :update]
  before_action :check_if_admin, only: [:edit, :destroy]      
  
  def index
		@orgs =	Organizer.all
	end
	
  # /organizer POST
	def create
	  @org = Organizer.create(orgs_params)
    if @org.errors.empty?
      redirect_to organizer_path(@org)
    else
      render "new"
    end
  end
  
  # /organizer GET
  def show
    unless @org
      render text: "Страница не найден", status: 404
    end
  end

  # /organizer/1/edit  GET
  def edit
  end

  # /organizer/new GET 
  def new
    @org = Organizer.new
  end

  # /organizer/1 DELETE
  def destroy
    @org.destroy
    redirect_to action: "index"
  end
  
  # /organizer/1 PUT
  def update
     @org.update_attributes(orgs_params)
    if @org.errors.empty?
      redirect_to organizer_path(@org)
    else
      render "edit"
    end
  end


    
  private
	# strong paramets of rails 4
	def orgs_params
		params.require(:organizer).permit(:last_name, :first_name, :email, :tel_1, :tel_2)
	end
  
  # for filter before_action
  def org_find
     @org = Organizer.find(params[:id])
  end

  def check_if_admin
    render text: "Доступ запрещён", status: 403 unless params[:admin] == true   
  end
end
