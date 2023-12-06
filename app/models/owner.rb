class Owner < User
  has_many :restaurants, dependent: :destroy, foreign_key: 'user_id'

  def self.ransackable_associations(auth_object = nil)
    ["restaurants"]
  end
end
