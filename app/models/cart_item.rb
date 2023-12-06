class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish

  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "dish_id", "id", "quantity", "updated_at"]
  end
end
