class EventController < ApplicationController


	def get_info

		id = params[:id]

		event = Event.find(id)
		products = event.products.as_json
		
		json = {:event => event, :products => products}.to_json

  		respond_to do |format|
    		format.html { render :text => json}
  		end	
	end

end
