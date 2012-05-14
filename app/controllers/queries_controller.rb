class QueriesController < ApplicationController

before_filter :require_login


private

  def require_login
    unless current_user
      redirect_to root_url , :notice => "You need to log in to use the query page!"
    end
  end

	def new
	  
	end
	
	def query

	end
end