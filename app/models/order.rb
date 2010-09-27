class Order < ActiveRecord::Base
  validates_presence_of :round, :pick, :team
  scope :draft, order("orders.round, orders.pick")
  scope :unchosen, where("orders.chosen = ?", false)
  scope :chosen, where("orders.chosen = ?", true)

  def self.next
    self.unchosen.first
  end
  
  def self.previous
    self.chosen.last
  end
end
