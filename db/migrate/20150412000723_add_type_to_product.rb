class AddTypeToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :product, index: true, foreign_key: true
  end
end
