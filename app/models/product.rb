class Product < ActiveRecord::Base
  belongs_to :event
  belongs_to :producttype

end
