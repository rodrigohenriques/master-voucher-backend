require 'simplify'

class Payment < ActiveRecord::Base
	has_many :itens


	def do_payment amount, tokenId, itemShopJson
	    payment = Simplify::Payment.create({
	        amount: amount,
	        token: tokenId,
	        description: 'Simplify Rails Example',
	        currency: 'USD'})

	    @result = payment['paymentStatus']

	    if "APPROVED" == @result
	    	save()
	    	hashItems = JSON.parse(itemShopJson)
	    	itens = hashItems
			itens.each do |itemShop|
			   product_id = itemShop["product"]["id"]
			   item = Item.new
			   item.product_id = product_id
			   item.quantity = itemShop["quantity"]

			   next if item.quantity < 1

			   item.payment = self
			   item.save!

			   clientItems = ClientItem.where("product_id = ?", product_id)

			   if clientItems.size == 1
			   		clientItem = clientItems.last
			   		clientItem.quantity += item.quantity
			   else
			   		clientItem = ClientItem.new
			   		clientItem.quantity = item.quantity
			   		clientItem.product_id = item.product_id
			   end

			   clientItem.save

			end
		end

	end

end
