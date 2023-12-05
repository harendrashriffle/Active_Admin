class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable,  stretches: 13

  validates :name, length: {minimum: 3}, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  # validates :encrypted_password, length: {minimum: 4}
  validates :type, inclusion: { in: ['Owner', 'Customer']}
  validates :mobile, length: {is: 10}, uniqueness: true, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "mobile", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "type", "unconfirmed_email", "updated_at"]
  end
end
