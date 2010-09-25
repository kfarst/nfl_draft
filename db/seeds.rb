# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'fastercsv'
require 'ruby-debug'

directory = File.dirname(__FILE__)

players = "/seed_data/players.csv"
puts "Loading player data..."

ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + players, :col_sep => ",", :headers => :first_row) do |row|
    name, position = row
    Player.create(:name => row[0], :position => row[1])
  end
end
puts "Done"

teams = "/seed_data/teams.csv"
puts "Loading team data..."

ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + teams, :col_sep => ",", :headers => :first_row) do |row|
    name, division = row
    Team.create(:name => row[0], :position => row[1])
  end
end
puts "Done"

order = "/seed_data/order.csv"
puts "Loading draft order data..."
ActiveRecord::Base.transaction do
  FasterCSV.foreach(directory + order, :col_sep => ",", :headers => :first_row) do |row|
    round, pick, team = row
    Order.create(:round => row[0], :pick => row[1], :team => row[2])
  end
end
puts "Done"
