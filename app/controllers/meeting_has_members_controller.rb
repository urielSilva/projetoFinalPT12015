class MeetingHasMembersController < ApplicationController
  before_action :set_meeting_has_member, only: [:show, :edit, :update, :destroy]

  # GET /meeting_has_members
  # GET /meeting_has_members.json
  def index
    if logged_in?
    @meeting_has_members = MeetingHasMember.all
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /meeting_has_members/1
  # GET /meeting_has_members/1.json
  def show
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /meeting_has_members/new
  def new
    if logged_in?
      @meeting_has_member = MeetingHasMember.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /meeting_has_members/1/edit
  def edit
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /meeting_has_members
  # POST /meeting_has_members.json
  def create
    if logged_in?
      @meeting_has_member = MeetingHasMember.new(meeting_has_member_params)

      respond_to do |format|
        if @meeting_has_member.save
          format.html { redirect_to @meeting_has_member }
          format.json { render :show, status: :created, location: @meeting_has_member }
        else
          format.html { render :new }
          format.json { render json: @meeting_has_member.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /meeting_has_members/1
  # PATCH/PUT /meeting_has_members/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @meeting_has_member.update(meeting_has_member_params)
          format.html { redirect_to @meeting_has_member }
          format.json { render :show, status: :ok, location: @meeting_has_member }
        else
          format.html { render :edit }
          format.json { render json: @meeting_has_member.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /meeting_has_members/1
  # DELETE /meeting_has_members/1.json
  def destroy
    if logged_in?
      @meeting_has_member.destroy
      respond_to do |format|
        format.html { redirect_to meeting_has_members_url }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_has_member
      @meeting_has_member = MeetingHasMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_has_member_params
      params.require(:meeting_has_member).permit(:meeting_id, :member_id,:meeting_mandatory,:meeting_presence)
    end
end
