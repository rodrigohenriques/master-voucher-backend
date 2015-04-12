class EventController < ApplicationController


	def get_info

		id = params[:id]

		event = Event.find(id)

		products = event.products.as_json

		products.each do |prod|
			prod[:type] = Producttype.find(prod["producttype_id"]).name
		end

		json = {:event => event.as_json, :products => products}.to_json

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
