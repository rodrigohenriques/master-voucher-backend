class CustomerController < ApplicationController

  def items

  	list = ClientItem.where("quantity > 0")

	list_hash = []

	list.each do |ci|
		list_hash << { "product" => ci.product, "quantity" => ci.quantity }
	end

	json = list_hash.to_json

	render json: json

  end

end
