class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.decimal :lat
      t.decimal :lng

      t.timestamps null: false
    end
  end
end
