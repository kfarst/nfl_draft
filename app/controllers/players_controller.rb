class PlayersController < ApplicationController
  def undrafted_players
    @players = Player.undrafted.alphabetical_by_last_name

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
