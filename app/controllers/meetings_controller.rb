class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]


  # GET /meetings
  # GET /meetings.json
  def index
    if logged_in?
      @meetings = Meeting.all
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /meetings/new
  def new
    if logged_in?
      @meeting = Meeting.new
      5.times {
        @meeting_has_members = @meeting.meeting_has_members.build(params[:member_id]) }
    else
      flash.now[:danger] = 'Somente membros podem adicionar reuniões'
      render 'sessions/new'
    end
  end

  # GET /meetings/1/edit
  def edit
    if logged_in?
      5.times {
        @meeting_has_members = @meeting.meeting_has_members.build(params[:member_id]) }
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    if logged_in?
      @meeting = Meeting.new(meeting_params)
      @meeting.criador_reuniao(current_user)

        if @meeting.save
          flash[:success] = 'Criado com sucesso'
          redirect_to meetings_path
        else
          flash.now[:danger] = 'Campos inválidos'
          render 'new'
        end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    if logged_in?
        if @meeting.update(meeting_params)
          flash.now[:success] = 'Atualizado com sucesso'
          render 'show'
        else
          flash.now[:danger] = 'Campos inválidos'
          render 'edit'
        end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    if logged_in?
      @meeting.destroy
      flash[:success] = 'Deletado com sucesso'
      redirect_to meetings_path
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.includes(:meeting_has_members).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:meeting_name, :meeting_description, :meeting_date, :agenda_id,
                                      meeting_has_members_attributes: [:id, :member_id,:meeting_mandatory,:meeting_presence])
    end
end
