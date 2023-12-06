class Customer < User
  has_many :orders, dependent: :destroy, foreign_key: 'user_id'
  has_one :cart, dependent: :destroy, foreign_key: 'user_id'

  def self.ransackable_associations(auth_object = nil)
    ["cart", "orders"]
  end

end
