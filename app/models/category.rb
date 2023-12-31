class Category < ApplicationRecord
  has_many :dishes

  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["dishes"]
  end
end
