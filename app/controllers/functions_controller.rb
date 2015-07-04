class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :edit, :update, :destroy]

  # GET /functions
  # GET /functions.json
  def index
    @functions = Function.all
  end

  # GET /functions/1
  # GET /functions/1.json
  def show
  end

  # GET /functions/new
  def new
    if logged_in? && current_user.admin?
      @function = Function.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /functions/1/edit
  def edit
    unless logged_in? && current_user.admin?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /functions
  # POST /functions.json
  def create
    if logged_in? && current_user.admin?
      @function = Function.new(function_params)

      respond_to do |format|
        if @function.save
          format.html { redirect_to @function }
          format.json { render :show, status: :created, location: @function }
        else
          format.html { render :new }
          format.json { render json: @function.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /functions/1
  # PATCH/PUT /functions/1.json
  def update
    if logged_in? && current_user.admin?
      respond_to do |format|
        if @function.update(function_params)
          format.html { redirect_to @function }
          format.json { render :show, status: :ok, location: @function }
        else
          format.html { render :edit }
          format.json { render json: @function.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger]= 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    if logged_in? && current_user.admin?
      @function.destroy
      respond_to do |format|
        format.html { redirect_to functions_url }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_params
      params.require(:function).permit(:function_name, :function_module, :function_url)
    end
end
