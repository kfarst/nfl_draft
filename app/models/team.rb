class Team < ActiveRecord::Base
  has_many :players, :through => :ownership
  validates_presence_of :name
  validates_presence_of :division
end
