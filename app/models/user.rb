class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }
  has_many :projects
  has_many :subscriptions
  has_many :stakeholder_updates, through: :projects

  before_create :generate_auth_code

  def generate_auth_code
    self.auth_code = SecureRandom.hex(20)
  end

  def default_project
    projects.order(created_at: :asc).first
  end
  
end
