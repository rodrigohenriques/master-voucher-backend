require 'json'

class PaymentController < ApplicationController
  def index

  end

  def pay

    pay = Payment.new

    @result = pay.do_payment(params['amount'], params['tokenId'], params['items'])

	render json: { "status" => @result, "payment_id" => pay.id }.to_json

  end


  def checkout

    pay = Payment.new

    @@customerToken = params['cardToken']

    @result = pay.do_payment(params['amount'], @@customerToken, params['cardToken'], [])

	render json: { "status" => @result, "payment_id" => pay.id }.to_json

  end

  def pay_master

    pay = Payment.new

    @result = pay.do_payment(params['amount'], params['tokenId'], params['items'])

	render json: { "status" => @result, "payment_id" => pay.id }.to_json

  end

end