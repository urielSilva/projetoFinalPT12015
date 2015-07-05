class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    if logged_in?
      @members = Member.all
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    unless logged_in?
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /members/new
  def new
    if logged_in? && current_user.admin?
      @member = Member.new
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # GET /members/1/edit
  def edit
    unless logged_in? && (current_user.admin? || current_user.id == @member.id)
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # POST /members
  # POST /members.json
  def create
    if logged_in? && current_user.admin?
      @member = Member.new(member_params)
      if @member.save
        flash[:success] = 'Membro criado com sucesso'
        redirect_to members_path
      else
        flash.now[:danger] = 'Campos inválidos'
        render 'new'
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    if logged_in? && (current_user.admin? || current_user.id == @member.id)
      if @member.update(members_params)
        flash[:success] = 'Membro atualizado com sucesso'
        redirect_to members_path
      else
        flash.now[:danger] = 'Campos inválidos'
        render 'edit'
      end
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    if logged_in? && current_user.admin?
      @member.destroy
      flash[:success] = 'Membro excluído com sucesso'
      redirect_to members_path
    else
      flash.now[:danger] = 'Você não possui autorização'
      render 'sessions/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.includes(:meeting_has_members).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:member_name, :member_email, :member_password, :job_id,
                                     :meeting_has_members_attributes,
                                     :meetings_attributes)
    end
end
