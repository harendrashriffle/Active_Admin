class Restaurant < ApplicationRecord
  belongs_to :owner, foreign_key: 'user_id'
  has_many :dishes, dependent: :destroy
  has_one_attached :image

  validates :name, uniqueness: {case_sensitive: false}, presence: true
  validates :location, presence: true
  validates :status, inclusion: { in: ['Open', 'Closed'] }

  def self.ransackable_attributes(auth_object = nil)
    ["blob_id", "created_at", "id", "location", "name", "status", "image", "updated_at", "user_id", "record_type", "record_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["dishes", "image_attachment", "image_blob", "owner"]
  end


end
