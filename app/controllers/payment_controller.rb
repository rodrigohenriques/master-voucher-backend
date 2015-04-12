require 'simplify'

class PaymentController < ApplicationController
  def index

    pay = Payment.new

    @result = pay.do_payment

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
