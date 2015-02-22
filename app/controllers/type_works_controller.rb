class TypeWorksController < ApplicationController
				
	def index
		@type_works =	TypeWork.all
	end
	
  # /tw POST
	def create
	  @type_work = TypeWork.create(type_work_params)
    if @type_work.errors.empty?
      redirect_to type_work_path(@type_work)
    else
      render "new"
    end
  end

  # /tw/1 GET
  def show
    unless @type_work =  TypeWork.where(id: params[:id]).first 
      render text: "Страница не найден", status: 404
    end
  end

  # /tw/1/edit  GET
  def edit
  end

  # /tw/new GET 
  def new
    @type_work = TypeWork.new
  end

  # /tw/1 DELETE
  def destroy
  end

  # /tw/1 PUT
  def update
  end

 
          private
		# strong paramets of rails 4
		def type_work_params
			params.require(:type_work).permit(:title)
		end
end
