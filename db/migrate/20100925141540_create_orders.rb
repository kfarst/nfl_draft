class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :round
      t.integer :pick
      t.string :team
      t.boolean :chosen, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
