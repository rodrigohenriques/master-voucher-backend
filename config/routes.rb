Rails.application.routes.draw do
  #ActiveAdmin.routes(self)


  root 'payment#index'

  get 'payment/index'
  get 'payment/pay'


end
