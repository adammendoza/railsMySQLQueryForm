class QueriesController < ApplicationController

before_filter :require_login

  def new
	  @query = Query.new
  end

  def create
    @query = Query.create!(params[:query])
    redirect_to @query
  end
  
  def show
    @query = Query.find(params[:id])
  end

private

  def require_login
    unless current_user
      redirect_to root_url , :notice => "You need to log in to use the query page!"
    end
  end


end