class EventController < ApplicationController


	def get_info

		id = params[:id]

		event = Event.find(id)

		event_hash = event.as_json

		products = event.products.as_json

		products.each do |prod|
			prod[:type] = Producttype.find(prod["producttype_id"]).name
		end

		event_hash[:products] = products

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
