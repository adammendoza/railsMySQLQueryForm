class OrdersController < ApplicationController

#NOTE that we have chosen a different pk than the rails default ('id')

  def show
    @orders = Order.find(params[:id])
  end

end