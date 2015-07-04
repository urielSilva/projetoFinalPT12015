class JobHasFunctionsController < ApplicationController
  before_action :set_job_has_function, only: [:show, :edit, :update, :destroy]

  # GET /job_has_functions
  # GET /job_has_functions.json
  def index
    if logged_in?
      @job_has_functions = JobHasFunction.all
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /job_has_functions/1
  # GET /job_has_functions/1.json
  def show
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /job_has_functions/new
  def new
    if logged_in? && current_user.admin?
      @job_has_function = JobHasFunction.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /job_has_functions/1/edit
  def edit
    unless logged_in? && current_user.admin?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /job_has_functions
  # POST /job_has_functions.json
  def create
    if logged_in? && current_user.admin?
      @job_has_function = JobHasFunction.new(job_has_function_params)

      respond_to do |format|
        if @job_has_function.save
          format.html { redirect_to @job_has_function }
          format.json { render :show, status: :created, location: @job_has_function }
        else
          format.html { render :new }
          format.json { render json: @job_has_function.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /job_has_functions/1
  # PATCH/PUT /job_has_functions/1.json
  def update
    if logged_in? && current_user.admin?
      respond_to do |format|
        if @job_has_function.update(job_has_function_params)
          format.html { redirect_to @job_has_function }
          format.json { render :show, status: :ok, location: @job_has_function }
        else
          format.html { render :edit }
          format.json { render json: @job_has_function.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /job_has_functions/1
  # DELETE /job_has_functions/1.json
  def destroy
    if logged_in? && current_user.admin?
      @job_has_function.destroy
      respond_to do |format|
        format.html { redirect_to job_has_functions_url }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_has_function
      @job_has_function = JobHasFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_has_function_params
      params.require(:job_has_function).permit(:job_id, :function_id)
    end
end
