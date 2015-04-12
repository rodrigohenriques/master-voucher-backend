class AddProducttypeToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :producttype, index: true, foreign_key: true
  end
end
