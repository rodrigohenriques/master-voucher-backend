Rails.application.routes.draw do

  get 'form/master_pass'

  ActiveAdmin.routes(self)


  root 'payment#index'

  get 'payment/form'
  post 'payment/pay'

  get '/event/:id', to: 'event#get_info', as: 'simple'

  get '/event/formatted/:id', to: 'event#get_event_products_formatted'

  post 'payment/checkout'

  post 'merchant/delivery/check', to: 'merchant#check'

  post 'merchant/delivery'

  get 'customer/items'

end
