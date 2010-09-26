Factory.define :order do |o|
  o.round ''
  o.pick ''
  o.team { Factory.next(:team_name) }
end

Factory.sequence :team_name do |n|
  "Team #{n}"
end
