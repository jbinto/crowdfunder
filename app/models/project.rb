class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  attr_accessible :description, :goal, :teaser, :title

  validates :title, :presence => true
  validates :description, :presence => true
  validates :teaser, :presence => true
  validates :goal, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
end
