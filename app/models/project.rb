class Project < ApplicationRecord
  belongs_to :user
  has_many :stakeholder_updates
  has_many :subscriptions

  scope :ready, -> { where.not(title: nil).where.not(website: nil).where.not(description: nil)}
  
  def self.except(project)
    where.not(id: project.id)    
  end

end
