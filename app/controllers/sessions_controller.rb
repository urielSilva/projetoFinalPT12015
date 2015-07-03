class SessionsController < ApplicationController
  def new
  end
 
  def create
  	user=Member.find_by(member_email: params[:session][:email])
  	if user && user.a(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = 'Email/senha invalidos'
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
