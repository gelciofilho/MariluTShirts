class CreatePlaceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :place_orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.integer :pay_type

      t.timestamps
    end
  end
end
