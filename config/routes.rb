NflDraft::Application.routes.draw do
  match "/undrafted_players" => "players#undrafted_players", :as => :undrafted_players
  match "/draft_player" => "teams#draft_player", :as => :draft_player
  match "/draft_status" => "orders#draft_status", :as => :draft_status
  match "/chosen_draft_picks" => "ownerships#chosen_draft_picks", :as => :chosen_draft_picks
end
