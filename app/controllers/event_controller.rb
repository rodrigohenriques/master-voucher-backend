class EventController < ApplicationController


	def get_info

		id = params[:id]

		event = Event.find(id)

		event_hash = event.as_json

		products = event.products.sort { |a,b| a.producttype_id <=> b.producttype_id }

		products_hash = []

		products.each do |prod|
			prod_hash = prod.as_json
			value = "%.2f" % prod.value
			new_value = value.gsub(/[^0-9]/, "")
			prod_hash[:value] = new_value
			prod_hash[:type] = Producttype.find(prod["producttype_id"]).name
			products_hash << prod_hash
		end

		event_hash[:products] = products_hash

		json = event_hash.to_json

  		render json: json


	end

	def get_event_products_formatted

		id = params[:id]

		event = Event.find(id)
		hash = {:event => event}

		producttypes = Producttype.all
		producttypes.each do |i|
		   puts i
		end

		products = event.products.as_json
		
		json = hash.to_json

  		respond_to do |format|
    		format.html { render :text => json}
  		end	
	end

end
