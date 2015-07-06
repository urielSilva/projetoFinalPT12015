class SessionsController < ApplicationController
  def new
  end
 
  def create
    if logged_in?
    flash.now[:danger] = 'Faça o logout antes de logar com um usuário diferente'
      render 'new'
    else
      user=Member.find_by(member_email: params[:session][:email])
      if user && user.auth(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Email/senha invalidos'
        render 'new'
      end
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
