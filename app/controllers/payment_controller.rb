require 'json'

class PaymentController < ApplicationController
  def index

  end

  def pay

    pay = Payment.new

    @result = pay.do_payment(params['amount'], params['tokenId'], params['items'])

	render json: { "status" => @result, "payment_id" => pay.id }.to_json

  end

end