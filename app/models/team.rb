class Team < ActiveRecord::Base
  has_many :players, :through => :ownership
  validates_presence_of :name
  validates_presence_of :division

  def aquire(current_draft_pick, player)

    ownership = Ownership.new
    ownership.team = team
    ownership.player = player
    ownership.round = current_draft_pick.round
    ownership.pick = current_draft_pick.pick
    ownership.save
  end
end
