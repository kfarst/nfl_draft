class OrdersController < ApplicationController
  def draft_status
    @current_pick = Order.next
    @last_pick = Order.previous
  end
end
