class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    if logged_in?
      @agendas = Agenda.all
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /agendas/new
  def new
    if logged_in?
      @agenda = Agenda.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /agendas/1/edit
  def edit
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /agendas
  # POST /agendas.json
  def create
    if logged_in?
      @agenda = Agenda.new(agenda_params)

      respond_to do |format|
        if @agenda.save
          format.html { redirect_to @agenda }
          format.json { render :show, status: :created, location: @agenda }
        else
          format.html { render :new }
          format.json { render json: @agenda.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @agenda.update(agenda_params)
          format.html { redirect_to @agenda }
          format.json { render :show, status: :ok, location: @agenda }
        else
          format.html { render :edit }
          format.json { render json: @agenda.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    if logged_in?
      @agenda.destroy
      respond_to do |format|
        format.html { redirect_to agendas_url }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:agenda_name, :agenda_description, :agenda_date)
    end
end
