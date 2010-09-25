class Player < ActiveRecord::Base
  has_one :team, :through => :ownership
  validates_presence_of :name
  validates_presence_of :position
end

