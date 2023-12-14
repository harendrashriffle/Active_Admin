class Order < ApplicationRecord
  belongs_to :customer, foreign_key: 'user_id'
  has_many :order_items, dependent: :destroy
  has_many :dishes, through: :order_items

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "price", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "dishes", "order_items"]
  end

end
