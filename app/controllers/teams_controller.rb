class TeamsController < ApplicationController
  def draft_player
    raise params.inspect
    player = Player.find_by_id(params[:player])
    current_draft_pick = Order.find_by_id(params[:order])

    if player.undrafted?
      Team.aquire(current_draft_pick, player)
    end
  end
end
