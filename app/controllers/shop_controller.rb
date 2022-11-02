class ShopController < ApplicationController
	def main
		@db = Item.where(user_id: params[:id])
	end

	def buy
		@item = Item.where(id: params[:id])
		if @item[0].stock.to_i > 0
			@item[0].stock -= 1
			@item[0].save
			inventory = Inventory.new
			inventory.user_id = session[:user]
			inventory.item_id = params[:id]
			inventory.price = @item[0].price
			inventory.timestamp = Time.now
			inventory.save
			redirect_to shop_main_path(params[:bid]),notice: 'buy item success'
		else
			redirect_to shop_main_path(params[:bid]),notice: 'out of order'
		end
	end
	
end
