class PlaceOrder < ApplicationRecord
    has_many :line_items, dependent: :destroy
    enum pay_type: {
        "Credit card" => 0,
        "PayPal" => 1
        }

    validates :name, :address, presence: true
    validates :pay_type, inclusion: pay_types.keys
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: {maximum: 105},
                        format: { with: VALID_EMAIL_REGEX }

    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
        end
    end
                        
end
