require 'simplify'

class PaymentController < ApplicationController
  def index

	payment = Simplify::Payment.create({
	        "card" => {
	            "number" => "5555555555554444",
	            "expMonth" => 11,
	            "expYear" => 15,
	            "cvc" => "123"
	        },
	        "amount" => 1000,
	        "currency"  => "USD",
	        "description" => "Description"
	})


    @result = payment['paymentStatus']

  	respond_to do |format|
    	format.html { render :text => @result }
  	end	


  end

  def pay
    payment = Simplify::Payment.create({
        amount: params['amount'],
        token: params['tokenId'],
        description: 'Simplify Rails Example',
        currency: 'USD'})

    @result = payment['paymentStatus']

  	respond_to do |format|
    	format.html { render :text => @result }
  	end	

  end

end
