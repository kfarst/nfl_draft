class CreateOwnerships < ActiveRecord::Migration
  def self.up
    create_table :ownerships do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :round
      t.integer :pick

      t.timestamps
    end
  end

  def self.down
    drop_table :ownerships
  end
end
