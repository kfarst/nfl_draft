class Player < ActiveRecord::Base
  has_one :team, :through => :ownership
  validates_presence_of :name
  validates_presence_of :position

  scope :undrafted, where("players.drafted <> 0")
  scope :alphabetical_by_last_name, order("name ASC")
end

