class JobHasFunctionsController < ApplicationController
  before_action :set_job_has_function, only: [:show, :edit, :update, :destroy]

  # GET /job_has_functions
  # GET /job_has_functions.json
  def index
    @job_has_functions = JobHasFunction.all
  end

  # GET /job_has_functions/1
  # GET /job_has_functions/1.json
  def show
  end

  # GET /job_has_functions/new
  def new
    @job_has_function = JobHasFunction.new
  end

  # GET /job_has_functions/1/edit
  def edit
  end

  # POST /job_has_functions
  # POST /job_has_functions.json
  def create
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
  end

  # PATCH/PUT /job_has_functions/1
  # PATCH/PUT /job_has_functions/1.json
  def update
    respond_to do |format|
      if @job_has_function.update(job_has_function_params)
        format.html { redirect_to @job_has_function }
        format.json { render :show, status: :ok, location: @job_has_function }
      else
        format.html { render :edit }
        format.json { render json: @job_has_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_has_functions/1
  # DELETE /job_has_functions/1.json
  def destroy
    @job_has_function.destroy
    respond_to do |format|
      format.html { redirect_to job_has_functions_url }
      format.json { head :no_content }
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
