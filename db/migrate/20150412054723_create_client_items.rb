class CreateClientItems < ActiveRecord::Migration
  def change
    create_table :client_items do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
