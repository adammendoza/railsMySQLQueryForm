class SessionsController < ApplicationController

skip_before_filter :require_user 

	def new
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to :controller => 'queries', :action => 'new' , :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

	def require_user
  		redirect_to login_path unless current_user
	end

end
