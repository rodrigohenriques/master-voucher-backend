ActiveAdmin.register Product do
  permit_params :name, :value, :unit, :event_id, :product_type_id
  
end
