require 'simplify'

class Payment < ActiveRecord::Base
	has_many :itens


    payment = Simplify::Payment.create({
        amount: amount,
        token: tokenId,
        description: 'Simplify Rails Example',
        currency: 'USD'})

    @result = payment['paymentStatus']

    if @"APPROVED" == @result
    	save()
		itens.each do |itemShop|
		   item = Item.new
		   item.product_id = itemShop.product_id
		   item.quantity = itemShop.quantity
		   item.payment = self
		   item.save!
		end
	end

end
