class Dish < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :restaurant
  belongs_to :category

  validates :name, uniqueness: {scope: :restaurant_id}, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "name", "price", "restaurant_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart_items", "carts", "category", "image_attachment", "image_blob", "order_items", "orders", "restaurant"]
  end

end
