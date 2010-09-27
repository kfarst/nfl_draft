class Order < ActiveRecord::Base
  validates_presence_of :round, :pick, :team
  scope :draft, order("orders.round, orders.pick")
end
