class Event < ActiveRecord::Base
  belongs_to :merchant
  has_many :products, dependent: :destroy
end
