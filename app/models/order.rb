class Order < ActiveRecord::Base
  scope :draft, order("orders.round, orders.pick")
end
