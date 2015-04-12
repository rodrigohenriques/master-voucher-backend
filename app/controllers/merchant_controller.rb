class MerchantController < ApplicationController

  def delivery

	id = params[:id]

	payment = Payment.find(id)

	items = JSON.parse(params[:items])

	items.each do |item|
		quantity = item[:quantity]
		product_id = item[:product_id]
		clientItems = ClientItem.where("product_id = ?", product_id)
		if clientItems.size == 1
			clientItem.last
			clientItem.quantity -= quantity
			clientItem.save
		end
	end

  end

  def check

  end

end
