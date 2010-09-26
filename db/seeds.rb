# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'fastercsv'

Player.destroy_all
Team.destroy_all
Order.destroy_all

directory = File.dirname(__FILE__)

players = "/seed_data/players.csv"
puts "Loading player data..."

ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + players, :row_sep => "\n", :headers => :first_row) do |row|
    name, position = row
    Player.create(:name => row["Player Name"], :position => row["Position"])
  end
end
puts "Done"

teams = "/seed_data/teams.csv"
puts "Loading team data..."

ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + teams, :row_sep => "\n", :headers => :first_row) do |row|
    name, division = row
    Team.create(:name => row["Name"], :division => row["Division"])
  end
end
puts "Done"

order = "/seed_data/order.csv"
puts "Loading draft order data..."
ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + order, :row_sep => "\n", :headers => :first_row) do |row|
    round, pick, team = row
    Order.create(:round => row["Round"], :pick => row["Pick"], :team => row["Team Name"])
  end
end
puts "Done"
