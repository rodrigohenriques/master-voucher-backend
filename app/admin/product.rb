ActiveAdmin.register Product do
  permit_params :name, :value, :unit, :event_id, :producttype_id
  
end
