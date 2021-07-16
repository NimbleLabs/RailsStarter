class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :name
  enum role: [:user, :owner, :admin]
  before_create :on_before_create

  def on_before_create
    self.auth_token = SecureRandom.hex.to_s
  end
end
