Factory.define(:ownership) do
  p.association :team_id, :factory => :team
  p.association :player_id, :factory => :player
  p.association :round, :factory => :order
  p.association :pick, :factory => :order
end
