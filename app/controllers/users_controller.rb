class UsersController < ApplicationController
skip_before_filter :require_login

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to root_url, :notice => "Account Created!"
	  else
	    render "new"
	  end
	end


end