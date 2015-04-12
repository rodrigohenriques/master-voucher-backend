class CreateProducttypes < ActiveRecord::Migration
  def change
    create_table :producttypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
