Rails.application.routes.draw do
  ActiveAdmin.routes(self)


  root 'payment#index'

  get 'payment/form'
  post 'payment/pay'
  get 'payment/token'


end
