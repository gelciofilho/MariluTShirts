class AddUserIdToPlaceOrder < ActiveRecord::Migration[6.0]
  def change
      add_column :place_orders, :user_id, :int
  end
end
