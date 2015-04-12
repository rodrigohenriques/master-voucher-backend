Rails.application.routes.draw do
  get 'form/master_pass'

  ActiveAdmin.routes(self)


  root 'payment#index'

  get 'payment/form'
  post 'payment/pay'
  get 'payment/token'

  get '/event/:id', to: 'event#get_info', as: 'patient'

end
