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
			clientItem = clientItems.last
			clientItem.quantity -= quantity
			clientItem.save
		end
	end

  end

  def check

	body = request.body.read

	items = JSON.parse(body)

	products = []

	items.each do |item|
		quantity = item["quantity"]
		product_id = item["product_id"]
		clientItem = ClientItem.where("product_id = ?", product_id).last

		if clientItem
			
			product = clientItem.product
			status = ""
			if clientItem.quantity >= quantity
				status = "ok"
			else
				status = "error"
			end
				
			products << {:product => product , :status => status, :quantity => quantity} 

		end

	end

	json = products.to_json


	render json: json

  end

end
