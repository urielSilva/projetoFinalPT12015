class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    if logged_in? && current_user.admin?
      @job = Job.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /jobs/1/edit
  def edit
    unless logged_in? && current_user.admin?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if logged_in? && current_user.admin?
      @job = Job.new(job_params)

      respond_to do |format|
        if @job.save
          format.html { redirect_to @job }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if logged_in? && current_user.admin?
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if logged_in? && current_user.admin?
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_name)
    end
end
