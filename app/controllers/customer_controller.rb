class CustomerController < ApplicationController

  def items

  	list = ClientItem.where("quantity > 0")

	list_hash = list.as_json

	json = list_hash.to_json

	render json: json

  end

end
