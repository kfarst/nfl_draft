Factory.define :ownership do |o|
  o.association :team, :factory => :team
  o.association :player, :factory => :player
  o.association :round, :factory => :order
  o.association :pick, :factory => :order
end
