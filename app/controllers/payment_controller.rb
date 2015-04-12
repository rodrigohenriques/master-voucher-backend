require 'json'

class PaymentController < ApplicationController
  def index

  end

  def pay

    pay = Payment.new

    @result = pay.do_payment params['amount'] params['tokenId'] params['items']

    respond_to do |format|
      format.html { render :text => @result }
    end 

  end

end