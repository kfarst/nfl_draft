class Ownership < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  validates_presence_of :pick
  validates_presence_of :round
end
